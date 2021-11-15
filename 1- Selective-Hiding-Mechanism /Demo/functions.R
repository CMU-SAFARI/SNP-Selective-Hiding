source("helper_functions.r")

# Function to find the king kinship coefficient between two people 
# inputs: genotype vectors
# output: kinship value (phi)
calculateKING <- function(d1,d2){
  n11 = length(which(d1==1 & d2==1))
  n1_ = length(which(d1==1))
  n_1 = length(which(d2==1))
  n02 = length(which(d1 == 0 & d2==2))
  n20 = length(which(d1 == 2 & d2==0))
  
  if(n1_ < n_1){
    return ((2*n11- 4*(n02 + n20)- n_1 +n1_)/(4* n1_))
  }else{
    return ((2*n11- 4*(n02 + n20)+ n_1 - n1_)/(4* n_1))
  }
  
}

# calculate number of snps to be removed between two indiviudals for predetermined kinship phi value
# inputs: genotype vectors, phi value
# output: number of snps to be removed (n_11)
calculateX <- function(d1,d2,phi){ #  : n_i < n_j
  n11 = length(which(d1==1 & d2==1))
  n1_ = length(which(d1==1))
  n_1 = length(which(d2==1))
  n02 = length(which(d1 == 0 & d2==2))
  n20 = length(which(d1 == 2 & d2==0))
  
  if(n1_ < n_1){
    
    return ((2*n11- 4*(n02 + n20)- n_1 +n1_ - 4 * n1_ * phi)/(2*(1-2*phi)))
  }else{
    return ((2*n11- 4*(n02 + n20)- n1_ +n_1 - 4 * n_1 * phi)/(2*(1-2*phi)))
  }
}

# Function to find the optimal snp set to be removed from sequentially upcoming family member 
# to provide predetermined kinship
# inputs: 
# genotype matrix of family members, 
# number of family members 
# binary kinship relations matrix i.e. relation(dad,wife) = 0, relation(wife,sister) = 1
# phi: predetermined kinship value to decrease
# output: list of snps to be removed from the latest arrival family member
findOptimalSNPSet <- function(genotype_matrix, number_of_people, relations, phi){
    
  X_general <- c()
  choice = 1
  removal_index <- 1 
  indices<-1:number_of_people
  arr <- which(relations == removal_index, arr.ind = TRUE)
  removal_rel <- relations[arr[,1],]

  o10 = 0
  o11 = 0
  o12 = 0


  if (is.null(nrow(removal_rel)))
  {
    removal_rel <- t(removal_rel)
  }
  
  #Fill X matrix for every pair of relationship i.e. for a three membered family create all combinations where only pairwise relationships are considered:
  #i.e. assume that A,B,C are the three membered family members. A-B and B-C are related. A is the latest arrived member. Only latest arrived members snps will be hidden.
  #For A-B relationship only x11* is considered, so x1*1=[x101, x111, x121]
  #similarly for B-C relationship:
  #x*11 is considered which is [x011,x111,x211]. However since snps are hidden only from the latest arrived member, only x1..'s are considered.
  #As a result X_general matrix consists of [x101,x111,x112]
  #If A and C would be related as well, then X_general will consist [x101,x111,x112,x101,x121]. 
  for (z in 1:nrow(removal_rel))
  {
    index1<-removal_rel[z,1] 
    index2<-removal_rel[z,2]
    new_indices<-indices[-removal_rel[z,]] # other people's indices
    
    X <- matrix( nrow = (3^(number_of_people - 2)), ncol = number_of_people)
    col1<-rep(c(0,1,2), times=3^(number_of_people - 2)/3)
    X[,new_indices[1]]<-col1
    if(number_of_people ==4) 
    {
      col2<-rep(c(0,1,2), each=3^(number_of_people - 2)/3)
      X[,new_indices[2]]<-col2
    }
    if(number_of_people ==5) 
    {
      col2<-rep(c(0,1,2), each=3^(number_of_people - 2)/3)
      X[,new_indices[2]]<-col2
      col3 <- rep(c(0,1,2), each=3^(number_of_people - 2)/3)
      X[,new_indices[3]]<-col3
      
    }
    
    X[,index1] <- rep(1,((3^(number_of_people - 2))))
    X[,index2] <- rep(1,((3^(number_of_people - 2)))) 
    X_general<- rbind(X_general,X)
  }
  
  X_general <- unique(X_general)
  
  #### Generate kinship constraints for optimization model  ####
  Amat<-c() #kinship constraint coefficients
  bvec<-c()#RHS of kinship constraints
  phi_rhs <-c()
  phi_x_array<- c()
  #calculate kinship constraints for every pair of relationships
  for (r in 1:nrow(relations))
  {
    #r<-3
    rel <- relations[r,]
    i<-rel[1]
    j<-rel[2]
    g1<-length(which(genotype[,i]==1,arr.ind=TRUE))
    g2<-length(which(genotype[,j]==1, arr.ind=TRUE))
    
    d <- length(which(genotype[,i]==1 & genotype[,j]==1, arr.ind=TRUE))
    c <- length(which(genotype[,i]==2 & genotype[,j]==0, arr.ind=TRUE)) + length(which(genotype[,i]==0 & genotype[,j]==2, arr.ind=TRUE))
    
    if(g1 > g2)
    {
      b<-g2
      a<-g1
    }  else
    {
      b<-g1
      a<-g2
    } # if choice = 0 or 1 Phi=0.
    
    
    RHS <- 2*d - 4*c -a + b - 4*b*phi;
    if(choice == 1)
    {
      phi_rhs <- c(phi_rhs,4*b)
    }
    
    bvec<- c(bvec,RHS)
    
    related_X_indices <- get_relatedX(X_general, rel)
    related_X_indices <- sort(related_X_indices)
    related_x <- X_general[related_X_indices,]
    
    obj_arr<-matrix(0,nrow = nrow(X_general), ncol = 1, byrow = TRUE)
    phi_arr <- matrix(0,nrow = nrow(X_general), ncol = 1, byrow = TRUE)
    
    x_11 <- which(related_x[,i] == 1 & related_x[,j]==1 , arr.ind = TRUE)
    x_20 <- c( which(related_x[,i] == 2 & related_x[,j]==0 , arr.ind = TRUE), which(related_x[,i] == 0 & related_x[,j]==2, arr.ind = TRUE))
    
    p <- which(compMat2(related_x[x_11,],X_general))
    q <- which(compMat2(related_x[x_20,],X_general))
    
    obj_arr[p] <- obj_arr[p] + 2
    obj_arr[q] <- obj_arr[q] - 4
    
    #kinship formula is not symmetric:
    #i > j
    if(g1 > g2)
    {
      x_1 <- which(related_x[,i] == 1 , arr.ind = TRUE)  # a
      x__1 <- which(related_x[,j] == 1  , arr.ind = TRUE)  #b
      s <- which(compMat2(related_x[x__1,],X_general))
      t <- which(compMat2(related_x[x_1,],X_general))
      
    } else
    {
      x_1 <-which(related_x[,j] == 1, arr.ind = TRUE) #a
      x__1 <-which(related_x[,i] == 1, arr.ind = TRUE) #b
      s <- which(compMat2(related_x[x__1,],X_general))
      t <- which(compMat2(related_x[x_1,],X_general))
    }
    
    obj_arr[t] <- obj_arr[t] - 1;
    obj_arr[s] <- obj_arr[s] + (1 - 4*phi); 
    
    phi_arr[s]<- -4
    phi_x_array<-rbind(phi_x_array, t(phi_arr))
    Amat <- rbind(Amat,t(obj_arr))
  }
  

  RHS2<-c()
  other_matrix <- c()
  for(a in 1:nrow(X_general))
  {
    x <- X_general[a,]
    str <- "";
    for(num in 1: number_of_people)
    { 
      if(num!=number_of_people)
      {
        str<-paste0(str,"genotype[,",num, "]==x[", num,"] & ") 
      }else
      {
        str<-paste0(str,"genotype[,",num, "]==x[", num,"]")  
      }  
    }
    str<-paste0("length(which(",str,",arr.ind=TRUE))" )
    n_x<-eval(parse(text=str))
    if(choice==0)
    {
      o_row<-rep(0,nrow(X_general) + 3)
    }else
    {
      o_row<-rep(0,nrow(X_general))
    }
    o_row[a] <- 1
    other_matrix <- rbind(other_matrix, o_row)
    RHS2 <- rbind(RHS2,n_x)
    
    
    
    for(index1 in 1:(number_of_people-1))
    {
      for(index2 in (index1+1):number_of_people)
      {
        if(!is.na(rowmatch2(relations,matrix(, data = c(index1,index2), ncol = 2))))
        {
          if(x[index1]==1 & x[index2]==1)
          {
            n11 <- length(which(genotype[,index1]==1 & genotype[,index2]==1, arr.ind = TRUE))
            o_row<-rep(0,nrow(X_general))
            o_row[a] <- 1
            other_matrix <- rbind(other_matrix, o_row)
            new_rhs<-n11-o11
            new_rhs <- (n11-o11)
            if(new_rhs < 0)
            {
              print(c(index1,index2))
              print("n11 < o11")
              print(n11 < o11)
              flag_11 <- TRUE
              new_rhs <- 0
            }
            RHS2 <- rbind(RHS2,new_rhs) 
            
          }
          #constraints where index1 and index2 user have 1 or 0 snp values
          if((x[index1]==1 & x[index2]==0) || (x[index1]==0 & x[index2]==1))
          {
            n10 <- length(which(genotype[,index1]==x[index1] & genotype[,index2]==x[index2], arr.ind = TRUE))
            o_row<-rep(0,nrow(X_general))
            o_row[a] <- 1
            other_matrix <- rbind(other_matrix, o_row)
            new_rhs<-n10-o10
            if(new_rhs < 0)
            {
              flag_10 <- TRUE
              print("n10 < o10")
              new_rhs <- 0
            }
            RHS2 <- rbind(RHS2,(new_rhs))
            
          }
          #constraints for where index1 and index2 user have 1 or 2 snp values
          if((x[index1]==1 & x[index2]==2) || (x[index1]==2 & x[index2]==1))
          {
            n12 <- length(which(genotype[,index1]==x[index1] & genotype[,index2]==x[index2], arr.ind = TRUE))
            o_row<-rep(0,nrow(X_general))
            o_row[a] <- 1
            other_matrix <- rbind(other_matrix, o_row)
            new_rhs <- n12-o12
            if(new_rhs < 0)
            {
              flag12 <- TRUE
              print("n12 < o12")
              new_rhs <- 0
            }
            RHS2 <- rbind(RHS2,new_rhs)
            
          }
          
        }
        
      }
      
    }
  }

  new_size_matrix <- c()
  for(index in 1:dim(X_general)[1])
  {
    new_size_matrix<- c(new_size_matrix,min(RHS2[which(other_matrix[,index]==1)]))
  }
  
  Amat <- rbind(Amat, diag(1,dim(X_general)[1],dim(X_general)[1]))
  bvec<-c(bvec,new_size_matrix)
  
  sense_vec<- c(rep("G", dim(relations)[1]), rep("L",length(new_size_matrix)))
  flag_minus <- FALSE
  minus_ind <- c()
  for( abc in 1:length(bvec))
  {
    if(bvec[abc] < 0)
    {
      flag_minus <- TRUE
      minus_ind <- c(abc, minus_ind)
    }
  }

  if(flag_minus == TRUE)
  {
    Amat[minus_ind,] <- -(Amat[minus_ind,])
    bvec[minus_ind] <- -bvec[minus_ind]
    sense_vec[minus_ind] <- "L"
  }
  
  cvec <- c(rep(1,nrow(X_general)))
  
  # optimal solution sets
  res<-Rcplex(cvec, Amat, bvec, Qmat = NULL, control=list(solnpoolintensity=4),
              objsense = c("min"), sense = sense_vec, vtype = rep("I",length(cvec)), n=500)
    
  # pick the first solution
  remove_list <- c()
  for( i in 1:nrow(X_general)){
    if(res[[1]]$xopt[i]>0){
      remove_list <- c(remove_list,
                       which(genotype[,1] == X_general[i,1] & genotype[,2] == X_general[i,2] & genotype[,3] == X_general[i,3] & genotype[,4] == X_general[i,4])[1:res[[1]]$xopt[i]]
      )
    }
  }

  return(remove_list)
}

