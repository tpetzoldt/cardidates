\name{plot.cardiPeakwindow}
\alias{plot.cardiPeakwindow}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot Method for cardiPeakwindow Objects}
\description{
  This function is intended to visualize peaks identified
  by the peakwindow function.
}
\usage{
\method{plot}{cardiPeakwindow}(x, y, add=FALSE, ...)
}

\arguments{
  \item{x}{an object of class \code{cardiPeakwindow} resulting from a call
    to \code{\link{peakwindow}},}
  \item{y}{not used, for compatibility with plot only,}
  \item{add}{if TRUE, highlight additional peaks in the plot,}
  \item{\dots}{other arguments passed to \code{\link{plot.default}}.}
}

\details{
  Peaks identified by \code{\link{peakwindow}} are labelled with their
  coresponding peak numbers. The first peak which occurs after \code{xstart}
  (e.g. spring peak in biological time series) is highlighted with red color.
}

\seealso{%\code{\link{dweibull}},
         \code{\link{weibull4}},
         \code{\link{weibull6}},
         \code{\link{fitweibull}},
         \code{\link{peakwindow}},
         \code{\link{CDW}}
         \code{\link[cardidates:cardidates-package]{cardidates}}
}


\examples{
## generate artificial test data
set.seed(123)
x <- seq(1, 365 * 3, 18)
y <- rlnorm(x, sd=0.6) +  5e-5 * exp(1e-4 * ((x-100) \%\% 365)^2) +
                          1e-4 * exp(3e-4 * ((x-220) \%\% 200)^2)

## identify peaks and mark first peak after a certain time x
peaks <- peakwindow(x, y, xstart=55)

## plot it
plot(peaks)

# highlight peaks of other years
peaks2 <- peakwindow(x, y, xstart = 420)
peaks3 <- peakwindow(x, y, xstart = 785)
plot(peaks2, add=TRUE)
plot(peaks3, add=TRUE)

## mark years
abline(v=seq(0, 365*3, 365), col="grey")
}

\keyword{ hplot }
\keyword{ methods }
