#***************************************************************************************/
#*    Title: (Modified) Rank Order Clustering
#*    Author: Nagdev Amruthnath
#*    Date: 2017
#*    Code version: 0.2.0
#*    Availability: https://github.com/nagdevAmruthnath/-mod--Rank-order-clustering
#*    
#*    Note: If MROC is used for research or publication, please use citation (Amruthnath, 2016)
#*          in readme.md
#***************************************************************************************/
##(Version 2.0) [Source code]. http://www.graphicsdrawer.com

# function to compute colweights
colWeightFun<- function(data,row,col,colWeight){
  binRowWeight<-data.frame(binRowWeight=integer())
  for(j in 1:row){
    for (i in 1:col){
      binRowWeight[i,]<-colWeight[i,]*data[j,i]
      
    }
    data[j,(col+1)]<-colSums(binRowWeight)
  }
  return(data)
}

# function to compute rowWeights
rowWeightFun<- function(CW_1,row,col,rowWeight){
  binColWeight<-data.frame(binColWeight=integer())
  for(j in 1:col){
    for (i in 1:row){
      binColWeight[i,]<-rowWeight[i,]*CW_1[i,j]
      
    }
    CW_1[(row+1),j]<-colSums(binColWeight)
  }
  return(CW_1)
}

ROC <- function(data) {
  
  #
  
  #data <- data.frame(data)
  #Assign Column numbers
  col <- ncol(data)
  colnames(data) <- 1:col
  colWeight <- data.frame(colWeight = integer())
  for (i in 1:col) {
    colWeight[i,] <- 2 ^ (i-1)
  }
  colWeight<-data.frame(colWeight=sort(colWeight$colWeight, decreasing=T))
  #Assign Row numbers
  row <- nrow(data)
  rownames(data) <- 1:row
  rowWeight <- data.frame(rowWeight = integer())
  for (i in 1:row) {
    rowWeight[i,] <- 2 ^ (i-1)
  }
  rowWeight<-data.frame(rowWeight=sort(rowWeight$rowWeight, decreasing=T))
  
  CW_1 <- colWeightFun(data, row, col, colWeight)
  rw_1 <- rowWeightFun(CW_1, row, col, rowWeight)
  k = 1
  continue<-TRUE
  while (k<50) {
    if (k == 1) {
      rw <- rw_1[order(rw_1[, col + 1],decreasing=T),]
      cw <- rw[, order(rw[row + 1,], decreasing=T)]
      CW_1 <- colWeightFun(cw, row, col, colWeight)
      rw_1 <- rowWeightFun(CW_1, row, col, rowWeight)
      old <- cw
      k = k + 1
    }
    if (k > 1) {
      rw <- rw_1[order(rw_1[, col + 1],decreasing=T),]
      cw <- rw[, order(rw[row + 1,],decreasing=T)]
      if (cw[,ncol(cw)] == old[,ncol(old)]) {
        if (cw[(nrow(cw)), 1:col] == old[(nrow(cw)), 1:col]) {
          break
          
        }
        
      }
      old <- cw
      CW_1 <- colWeightFun(cw, row, col, colWeight)
      rw_1 <- rowWeightFun(CW_1, row, col, rowWeight)
      k = k + 1
      
    }
  }
  
  return(old)
}
