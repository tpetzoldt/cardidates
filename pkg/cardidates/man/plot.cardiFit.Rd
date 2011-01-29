\name{plot.cardiFit}
\alias{plot.cardiFit}

\title{Plot Method for cardiFit Objects}
\description{
  This function is a top-level function to visualize cardinal date objects
  fitted with fitweibull4 and fitweibull6.
}
\usage{
\method{plot}{cardiFit}(x, y = NULL, xmin = 0, xmax = 365, quantile = 0.05, symmetric = FALSE, ...)
}

\arguments{
  \item{x}{object of class \code{cardiFit} resulting from a call to
    \code{\link{fitweibull6}} or \code{\link{fitweibull4}},}
  \item{y}{not used, for compatibility with plot only}
  \item{xmin}{left boundary (in day of year) of the integral under the curve}
  \item{xmax}{right boundary (in day of year) of the integral under the curve}
  \item{quantile}{two-sided quantile (percentage of integral)
       which defines beginning and end of the peak}
  \item{symmetric}{if (\code{TRUE}), quantiles are calculated for the whole area
       under the curve, otherwise for each of the branches separately.}
  \item{\dots}{other arguments passed to \code{\link{plot.default}}}
}
\details{
  See \code{\link{CDW}} for a detailed description of parameters.
}

\seealso{%\code{\link{dweibull}},
         \code{\link{weibull4}},
         \code{\link{weibull6}},
         \code{\link{fitweibull}},
         \code{\link{peakwindow}},
         %\code{\link{CDW}}
         \code{\link[cardidates:cardidates-package]{cardidates}}
}

\examples{
## create some test data
set.seed(123)
x <- seq(0, 360, length=20)
y <- abs(rnorm(20, mean=1, sd=0.1))
y[5:10] <- c(2,4,7,3,4,2)

## fit Weibull function with 6 free parameters
res <- fitweibull6(x, y)

## see the results
plot(res)
summary(res)
}

\keyword{ hplot }
\keyword{ methods }

