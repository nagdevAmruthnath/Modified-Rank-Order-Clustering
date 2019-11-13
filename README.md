# Modified Rank Order Clustering

This REPO contains source code (in -mod--Rank-order-clustering/ROC/R/ROC.R) as well as package file (ROC_0.1.0.zip file in root) for Modified & Rank Order clustering. This package contains two functions ROC() and MROC(). ROC function runs based on algorithm proposed by King in 1980. MROC function is based on the algorithm proposed by Amruthnath in 2016. The package includes documentation. 

### Installation of package
The following package has been tested by installing them directly through R

```
# install devtools
install.packages("devtools")

# load library
library(devtools)

# install MROC package
devtools::install_github("nagdevAmruthnath/Modified-Rank-Order-Clustering")

# Load ROC library
library(ROC)
```

### Create Machine Component Data

```
# A function to create a random data matrix
# Reference: http://dirk.eddelbuettel.com/blog/2012/09/02/#faster_binomial_matrix_creation

createData = function(N, K) {
  matrix(rbinom(N * K, 1, 0.5), ncol = K, nrow = N)
}

# use above function to create 10 x 10 matrix
data = as.data.frame(createData(10,10))

# view that random data
data

#    V1 V2 V3 V4 V5 V6 V7 V8 V9 V10
# 1   0  1  0  0  0  1  1  0  0   1
# 2   0  0  0  0  1  0  0  0  1   0
# 3   0  0  1  0  0  1  0  1  0   1
# 4   1  0  1  1  0  0  0  0  0   1
# 5   0  1  1  0  1  0  1  1  0   1
# 6   1  0  1  1  1  0  1  1  0   1
# 7   1  1  0  0  1  1  0  0  0   0
# 8   0  0  1  0  1  0  1  0  0   0
# 9   1  1  1  0  1  0  1  1  0   1
# 10  0  1  1  0  0  1  1  1  1   0
```
### ROC: Rank Order Clustering

#### Description
This performs Rank Order Clustering matrix for production flow analysis. The result matrix can be used to cluster machines and part numbers

#### Usage
`ROC(x)`

#### Arguments
`x`	is a data frame without column names or row names. Columns are partnumbers and rows are machines

#### Details
This function takes any number of machines or partnumbers to generate a Rank Order Clustering Matrix. This algorithm is based on Kings (1981) algorithm for production flow analysis. Maximum iterations are set to 50.

#### Value
result	is a data frame consisting of final matrix from the algorithm

#### Note:
This algorithm is tested out for upto 100 x 100 matrix

#### Examples

```
# load ROC library
library(ROC)

# run ROC algorithm
ROC(data)
#      1   5   2   3  10   7   8   6   4  9  V11
# 9    1   1   1   1   1   1   1   0   0  0 1016
# 7    1   1   1   0   0   0   0   1   0  0  900
# 6    1   1   0   1   1   1   1   0   1  0  890
# 4    1   0   0   1   1   0   0   0   1  0  610
# 5    0   1   1   1   1   1   1   0   0  0  504
# 8    0   1   0   1   0   1   0   0   0  0  336
# 2    0   1   0   0   0   0   0   0   0  1  257
# 10   0   0   1   1   0   1   1   1   0  1  221
# 1    0   0   1   0   1   1   0   1   0  0  180
# 3    0   0   0   1   1   0   1   1   0  0  108
# 11 960 952 806 757 739 694 677 263 192 12   NA
```



### MROC Modified Rank Order Clustering


#### Description
This function provides the Modified Rank Order Clustering result matrix. This can be used to cluster the machines and components.

#### Usage
`MROC(data, compWeight, machineWeight)`

#### Arguments
`data`:         	a data frame without row names and column names. Just include the machine component matrix
`compWeight`:	    a single data frame containing numerical component weighs
`machineWeight`:	a single data frame containing numerical machine weighs

#### Details
This function is built for product flow in cellular manufacturing. This function is built based on Modified Rank Order Clustering proposed by Amruthnath and Gupta (2016). This algorithm is an extension of Rank Order Clustering but, it uses weight to reorder the initial matrix first.

Value
`result`:       	MROC matrix as a data frame

#### Examples

```
# create random 10 weights for components
compWeight = sample(1:100, 10)
compWeight
# [1] 100  74  50  85   7  46  87  92  36  59

# create random 10 weights for machines
machineWeight = sample(1:100, 10)
machineWeight
# [1] 98 37 48 50 15 23 18 19 77  2

# run MROC algorithm with weights
MROC(data, compWeight , machineWeight)
#      X5  X9  X2  X1  X6  X3  X7  X8 X10 X4 V11
# 2     1   1   0   0   0   0   0   0   0  0 768
# 7     1   0   1   1   1   0   0   0   0  0 657
# 9     1   0   1   1   0   1   1   1   1  0 631
# 5     1   0   1   0   0   1   1   1   1  0 630
# 6     1   0   0   1   0   1   1   1   1  1 623
# 8     1   0   0   0   0   1   1   0   0  0 580
# 10    0   1   1   0   1   1   1   1   0  0 470
# 3     0   0   0   0   1   1   0   1   1  0 226
# 1     0   0   1   0   1   0   1   0   1  0 180
# 4     0   0   0   1   0   1   0   0   1  1 105
# 11 1008 520 458 417 270 253 250 236 231 33  NA
```

----------------------------------------------------------------------------------------------------------------------------------------
References
----------------------------------------------------------------------------------------------------------------------------------------
J. R. KING (1980), Machine-component grouping in production flow analysis: an approach using a rank order clustering algorithm International Journal of Production Research Vol. 18 , Iss. 2,1980

Amruthnath, N., & Gupta, T. (2016). Modified Rank Order Clustering Algorithm Approach by Including Manufacturing Data. IFAC-PapersOnLine, 49(5), 138-142.
