# (mod)-Rank-order-clustering

>>This REPO contains source code (in ROC folder) as well as package file (zip file in root) for Modified & Rank Order clustering. This package contains two functions ROC() and MROC(). ROC function runs based on algorithm proposed by King in 1980. MROC function is based on the algorithm proposed by Amruthnath in 2016. The package includes documentation. 

----------------------------------------------------------------------------------------------------------------------------------------
>>ROC<<  Rank Order Clustering
----------------------------------------------------------------------------------------------------------------------------------------

Description
This performs Rank Order Clustering matrix for production flow analysis. The result matrix can be used to cluster machines and part numbers

Usage
ROC(x)

Arguments
x	is a data frame without column names or row names. Columns are partnumbers and rows are machines

Details
This function takes any number of machines or partnumbers to generate a Rank Order Clustering Matrix. This algorithm is based on Kings (1981) algorithm for production flow analysis. Maximum iterations are set to 50.

Value
result	is a data frame consisting of final matrix from the algorithm

Note:
This algorithm is tested out for upto 100 x 100 matrix

Examples
---- Rank Order Clustering ----
result<-ROC(data)
result


----------------------------------------------------------------------------------------------------------------------------------------
>>MROC<< Modified Rank Order Clustering
----------------------------------------------------------------------------------------------------------------------------------------

Description
This function provides the Modified Rank Order Clustering result matrix. This can be used to cluster the machines and components.

Usage
MROC(data, compWeight, machineWeight)

Arguments
data:         	a data frame without row names and column names. Just include the machine component matrix
compWeight:	    a single data frame containing numerical component weighs
machineWeight:	a single data frame containing numerical machine weighs

Details
This function is built for product flow in cellular manufacturing. This function is built based on Modified Rank Order Clustering proposed by Amruthnath and Gupta (2016). This algorithm is an extension of Rank Order Clustering but, it uses weight to reorder the initial matrix first.

Value
result:       	MROC matrix as a data frame

Examples
---- Should be DIRECTLY executable !! ----
result<-MROC(data, componentweight, machineweight)
result

----------------------------------------------------------------------------------------------------------------------------------------
References
----------------------------------------------------------------------------------------------------------------------------------------
J. R. KING (1980), Machine-component grouping in production flow analysis: an approach using a rank order clustering algorithm International Journal of Production Research Vol. 18 , Iss. 2,1980

Amruthnath, N., & Gupta, T. (2016). Modified Rank Order Clustering Algorithm Approach by Including Manufacturing Data. IFAC-PapersOnLine, 49(5), 138-142.
