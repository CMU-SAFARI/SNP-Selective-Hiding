get_relatedX <- function(X_general , rel) 
{
  pairs<-matrix(c(1,2,1,0,0,1,2,1,0,2,2,0,1,1), ncol = 2, byrow = TRUE) # kinship calculation is affected by these pairs
  related_X_indices<-c()
  for( p in 1:nrow(pairs))
  {
    p1<-pairs[p,1]
    p2<-pairs[p,2]
    ind <- which(X_general[,rel[1]]==p1 & X_general[,rel[2]]==p2, arr.ind=TRUE);
    related_X_indices<- c(ind,related_X_indices);
  }
  return(related_X_indices)
}

compMat2 <- function(A, B) {  # rows of B present in A 
  B0 <- B[!duplicated(B), ] 
  na <- nrow(A); 
  nb <- nrow(B0) ;
  if( is.null(na))
    na <- 1
  if(is.null(B))
    nb <- 1;
  
  AB <- rbind(A, B0) 
  ab <- duplicated(AB)[(na+1):(na+nb)] 
  return(ab) 
} 

rowmatch <- function(x, want) {
  isTRUE(all.equal(x, want))
}

rowmatch2 <- function(A,B) { 
  # Rows in A that match the rows in B
  f <- function(...) paste(..., sep=":")
  if(!is.matrix(B)) B <- matrix(B, 1, length(B))
  a <- do.call("f", as.data.frame(A))
  b <- do.call("f", as.data.frame(B))
  match(b, a)
}