\name{MROC}
\alias{MROC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Modified Rank Order Clustering
}
\description{
This function provides the Modified Rank Order Clustering result matrix. This can be used to cluster the machines and components.
}
\usage{
MROC(data, compWeight, machineWeight)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
a data frame without row names and column names. Just include the machine component matrix
}
  \item{compWeight}{
a single data frame containing numerical component weighs
}
  \item{machineWeight}{
a single data frame containing numerical machine weighs
}
}
\details{
This function is built for product flow in cellular manufacturing. This function is built based on Modified Rank Order Clustering proposed by Amruthnath and Gupta (2016). This algorithm is an extension of Rank Order Clustering but, it uses weight to reorder the initial matrix first.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
\item{result}{MROC matrix as a data frame}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
Amruthnath, N., & Gupta, T. (2016). Modified Rank Order Clustering Algorithm Approach by Including Manufacturing Data. IFAC-PapersOnLine, 49(5), 138-142.
}
\author{
Nagdev Amruthnath
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
result<-MROC(data, componentweight, machineweight)
result
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ROC }% use one of  RShowDoc("KEYWORDS")
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
