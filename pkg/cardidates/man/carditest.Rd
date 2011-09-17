\name{carditest}
\docType{data}
\alias{carditest}
\title{Artificial Data Set: 3 Years of Phytoplankton}
\description{
  The data contains 3 years of an artificial phytoplankton data set
  which conforms to the \code{\link{metaCDW}} data structure.
}
\usage{
data(carditest)
}
\format{
  A data frame with the following 4 columns:
  \describe{
    \item{\code{sample}}{time code}
    \item{\code{x}}{day of year (interval 0 \dots 365)}
    \item{\code{y}}{observed biovolume, abundance etc.}
    \item{\code{flag}}{validity flag to switch single data records on 
      (\code{TRUE}) or off (\code{FALSE}), defaults to \code{TRUE}}
  }  
}

\seealso{\code{\link{metaCDW}}}

\examples{
data(carditest)
head(carditest)
#View(carditest)
}

\keyword{datasets}
