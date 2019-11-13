\name{ROC}
\alias{ROC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Rank Order Clustering
}
\description{
This performs Rank Order Clustering matrix for production flow analysis. The result matrix can be used to cluster machines and part numbers
}
\usage{
ROC(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
is a data frame without column names or row names. Columns are partnumbers and rows are machines
}
}
\details{
This function takes any number of machines or partnumbers to generate a Rank Order Clustering Matrix. This algorithm is based on Kings (1981) algorithm for production flow analysis. Maximum iterations are set to 50.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
 \item{result }{is a data frame consisting of final matrix from the algorithm}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
J. R. KING (1980), Machine-component grouping in production flow analysis: an approach using a rank order clustering algorithm International Journal of Production Research Vol. 18 , Iss. 2,1980
}
\author{
Nagdev Amruthnath
}
\note{
This algorithm is tested out for upto 100 x 100 matrix
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Rank Order Clustering ----

result<-ROC(data)
result
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ROC}% use one of  RShowDoc("KEYWORDS")
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
