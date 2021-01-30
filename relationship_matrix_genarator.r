source("functions.R")
relationship_matrix <- function(){
 

  ## Define relationship matirx ###
  if(family == "A")
  {
    
    relations<- matrix(c(1,3,0,1,4,0,1,5,0,2,3,0,2,5,0,3,4,0,3,5,0,4,5,0), ncol = 3 ,byrow = TRUE)
    genotype_index<-matrix(,length(files),2)
    
    for(i in 1:length(files))
    {
      if(isTRUE(grep("Aunts",files[i]) == 1)) {
        genotype_index[i,1]<-1
        genotype_index[i,2]<-"aunt"
        if(any(relations[,1]==1)){
          rows = relations[,1]==1
          relations[rows,3] = relations[rows,3] + 1
        }
        if(any(relations[,2]==1)){
          rows = relations[,2]==1
          relations[rows,3] = relations[rows,3] + 1
        }
      } else if(isTRUE(grep("Dads",files[i]) == 1)){
        print("dad")
        genotype_index[i,1] <- 2
        genotype_index[i,2] <-"dad"
        if(any(relations[,2]==2))
        {
          rows = relations[,2]==2
          relations[rows,3] = relations[rows,3] + 1
        }
        if(any(relations[,1]==2))
        {
          rows = relations[,1]==2
          relations[rows,3] = relations[rows,3] + 1
        } 
        
      } else if(isTRUE(grep("Daughter",files[i]) == 1)){
        print("da??ghter")
        genotype_index[i,1]<-3
        genotype_index[i,2]<-"daughter"
        if(any(relations[,2]==3))
        {
          rows = relations[,2]==3
          relations[rows,3] = relations[rows,3] + 1
        }
        if(any(relations[,1]==3))
        {
          rows = relations[,1]==3
          relations[rows,3] = relations[rows,3] + 1
        } 
        
      } else if(isTRUE(grep("Moms",files[i]) == 1)){
        print("mom")
        genotype_index[i,1] <- 4
        genotype_index[i,2] <- "mom"
        
        if(any(relations[,2]==4))
        {
          rows = relations[,2]==4
          relations[rows,3] = relations[rows,3] + 1
        }
        if(any(relations[,1]==4))
        {
          rows = relations[,1]==4
          relations[rows,3] = relations[rows,3] + 1
        } 
      }else  {
        print("son")
        genotype_index[i,1]<-5
        genotype_index[i,2]<-"son"
        if(any(relations[,2]==5))
        {
          rows = relations[,2]==5
          relations[rows,3] = relations[rows,3] + 1
        }
        if(any(relations[,1]==5))
        {
          rows = relations[,1]==5
          relations[rows,3] = relations[rows,3] + 1
        }
      }
    }
    
    
    relations = relations[relations[,3]==2,1:2]
    if (is.null(dim(relations)))
    {
      relations <- t(relations)
    }  
    
    pos = gregexpr('/', getwd()) 
    foldername = substr(getwd(),pos[[1]][length(pos[[1]])-1]+1,pos[[1]][length(pos[[1]])]-1)
    family_order <- sapply(strsplit(foldername, "-"), "[")
    
    new_relations<-matrix(,nrow = dim(relations)[1], ncol = dim(relations)[2])
    for (i in 1:length(family_order))
    {
      if(family_order[i]=="aunt")  
      {
        indices <- which(relations == 1)
      }else if(family_order[i]=="dad")  
      {
        indices <- which(relations == 2)
      }else if(family_order[i]=="daughter")  
      {
        indices <- which(relations == 3)
      }else if(family_order[i]=="mom")  
      {
        indices <- which(relations == 4)
      } else
      {
        indices <- which(relations == 5)
      }
      print("i:")
      print(i)
      
      new_relations[indices] = length(family_order)-i+1
      print(length(family_order)-i+1)
    }
    relations <- t(apply(new_relations,1,sort))
  }else{ # Family B
    
    relations<- matrix(c(3,5, 0,4,5,0, 3,4,0, 1,2,0 ,1,3,0,2,3,0), ncol = 3 ,byrow = TRUE)
    genotype_index<-matrix(,length(files),2)
    
    for(i in 1:length(files))
    {
      if(isTRUE(grep("1860",files[i]) == 1)) {
        genotype_index[i,1]<-1
        genotype_index[i,2]<-"baba"
        if(any(relations[,1]==1)){
          rows = relations[,1]==1
          relations[rows,3] = relations[rows,3] + 1
        }
        if(any(relations[,2]==1)){
          rows = relations[,2]==1
          relations[rows,3] = relations[rows,3] + 1
        }
      } else if(isTRUE(grep("1861",files[i]) == 1)){
        genotype_index[i,1] <- 2
        genotype_index[i,2] <-"amca"
        if(any(relations[,2]==2))
        {
          rows = relations[,2]==2
          relations[rows,3] = relations[rows,3] + 1
        }
        if(any(relations[,1]==2))
        {
          rows = relations[,1]==2
          relations[rows,3] = relations[rows,3] + 1
        } 
        
      } else if(isTRUE(grep("1862",files[i]) == 1)){
        genotype_index[i,1]<-3
        genotype_index[i,2]<-"cocuk"
        if(any(relations[,2]==3))
        {
          rows = relations[,2]==3
          relations[rows,3] = relations[rows,3] + 1
        }
        if(any(relations[,1]==3))
        {
          rows = relations[,1]==3
          relations[rows,3] = relations[rows,3] + 1
        } 
        
      } else if(isTRUE(grep("1863",files[i]) == 1)){
        genotype_index[i,1] <- 4
        genotype_index[i,2] <- "anne"
        
        if(any(relations[,2]==4))
        {
          rows = relations[,2]==4
          relations[rows,3] = relations[rows,3] + 1
        }
        if(any(relations[,1]==4))
        {
          rows = relations[,1]==4
          relations[rows,3] = relations[rows,3] + 1
        } 
      }else  {
        genotype_index[i,1]<-5
        genotype_index[i,2]<-"teyze"
        if(any(relations[,2]==5))
        {
          rows = relations[,2]==5
          relations[rows,3] = relations[rows,3] + 1
        }
        if(any(relations[,1]==5))
        {
          rows = relations[,1]==5
          relations[rows,3] = relations[rows,3] + 1
        }
      }
    }
    
    relations = relations[relations[,3]==2,1:2]
    if (is.null(dim(relations)))
    {
      relations <- t(relations)
    }  
    
    pos = gregexpr('/', getwd()) 
    foldername = substr(getwd(),pos[[1]][length(pos[[1]])-1]+1,pos[[1]][length(pos[[1]])]-1)
    family_order <- sapply(strsplit(foldername, "-"), "[")
    
    new_relations<-matrix(,nrow = dim(relations)[1], ncol = dim(relations)[2])
    for (i in 1:length(family_order))
    {
      if(family_order[i]=="teyze")  
      {
        indices <- which(relations == 5)
      }else if(family_order[i]=="cocuk")  
      {
        indices <- which(relations == 3)
      }else if(family_order[i]=="baba")  
      {
        indices <- which(relations == 1)
      }else if(family_order[i]=="amca")  
      {
        indices <- which(relations == 2)
      } else
      {
        indices <- which(relations == 4)
      }
      print("i:")
      print(i)
      
      new_relations[indices] = length(family_order)-i+1
      print(length(family_order)-i+1)
    }
    relations <- t(apply(new_relations,1,sort))
    
    
  }
  
  new_genotype<-matrix(,nrow=nrow(genotype),ncol=ncol(genotype))
  rev_fam_order <-rev(family_order)
  for(i in 1:length(rev_fam_order))
  {
    new_ind <- which(genotype_index[,2]==rev_fam_order[i])
    new_genotype[,i] <- genotype[,new_ind]
    print(new_ind)
  }
 
  return(new_genotype)
 
}
