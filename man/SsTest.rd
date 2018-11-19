\name{SsTest}
\alias{SsTest}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Shan, Young and Kang's S Test}
\description{
\code{SsTest} performs S test.
}

\usage{SsTest(formula, data, alpha = 0.05, na.rm = TRUE, verbose = TRUE)}

%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} gives the sample values and \code{rhs} the corresponding groups.}
  \item{data}{a data frame containing the variables in the formula \code{formula}} 
  \item{alpha}{the level of significance to assess the statistical difference. Default is
set to alpha = 0.05.} 
  \item{na.rm}{a logical value indicating whether NA values should be stripped before the computation proceeds.}
  \item{verbose}{a logical for printing output to R console.}

}

%\details{
%%  ~~ If necessary, more details than the description above ~~
%}


\value{
A list with class "owt" containing the following components:

\item{statistic}{the S test statistic.}
\item{mean}{the mean of the S test statistic.}
\item{variance}{the variance of the S test statistic.}
\item{Z}{the standardized test statistic.}
\item{p.value}{the p-value of the test.}
\item{alpha}{the level of significance.} 
\item{method}{the character string "S test".}
\item{data}{a data frame containing the variables in which NA values (if exist) are removed.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} gives the sample values and \code{rhs} the corresponding groups.}


}

\references{

Jonckheere, A. R. (1954). A Distribution-Free k-Sample Test Against Ordered Alternatives. \emph{Biometrika}, \bold{41}, 133-145.

Shan, G., Young, D., Kang, L.(2014). A New Powerful Nonparametric Rank Test for Ordered Alternative Problem. \emph{Plos One}, \bold{9:11}, 1-10.

}


\author{
Bulent Altunkaynak}



\examples{

library(npordtests)

## Data from Jonckheere (1954)

X<-as.factor(c(1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4))
Y<-c(19,20,60,130,21,61,80,129,40,99,100,149,49,110,151,160)
data<-cbind.data.frame(X,Y)
SsTest(Y~X,data)

}

\keyword{functions}
