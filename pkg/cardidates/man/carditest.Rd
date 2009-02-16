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
\format{Two data frames of two variables with the following components:

\describe{
  A data frame of phytoplankton biovolume (or other time series) of several 
  years, samples or both with the following 4 columns:

       \describe{
          \item{\code{sample:}}{time code}
          \item{\code{doy:}}{day of year (interval 0 \dots 365)}
          \item{\code{y:}}{observed biovolume, abundance etc.}
          \item{\code{flag:}}{validity flag to switch single data records on 
            (\code{TRUE}) or off (\code{FALSE}), defaults to \code{TRUE}}
       }}  
}

\seealso{\code{\link{metaCDW}}}

\keyword{datasets}
