

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
    colWeight[i,] <- 2 ^ i
  }
  colWeight<-data.frame(colWeight=sort(colWeight$colWeight, decreasing=T))
  #Assign Row numbers
  row <- nrow(data)
  rownames(data) <- 1:row
  rowWeight <- data.frame(rowWeight = integer())
  for (i in 1:row) {
    rowWeight[i,] <- 2 ^ i
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


MROC <- function(data, compWeight, machineWeight) {

  compWeight<-data.frame(compWeight=compWeight)
  machineWeight<-data.frame(machineWeight=machineWeight)

  #data <- data.frame(data)
  #Assign Column numbers
  col <- ncol(data)
  colnames(data) <- 1:col
  colWeight <- data.frame(colWeight = integer())
  for (i in 1:col) {
    colWeight[i,] <- 2 ^ i
  }
  colWeight<-data.frame(colWeight=sort(colWeight$colWeight, decreasing=T))
  #Assign Row numbers
  row <- nrow(data)
  rownames(data) <- 1:row
  rowWeight <- data.frame(rowWeight = integer())
  for (i in 1:row) {
    rowWeight[i,] <- 2 ^ i
  }
  rowWeight<-data.frame(rowWeight=sort(rowWeight$rowWeight, decreasing=T))

  data_1<-data.frame(cbind(data,machineWeight))
  data_1<-data_1[order(data_1$machineWeight),1:ncol(data)]
  rownames(compWeight)<-colnames(data_1)
  data_2<-data.frame(rbind(data_1,t(compWeight)))
  data<-data.frame(data_2[1:nrow(data),order(data_2[nrow(data_2),])])

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


