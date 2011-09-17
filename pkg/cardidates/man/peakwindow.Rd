\name{peakwindow}
\alias{peakwindow}

\title{Identify Peaks in Time Series}
\description{
  This function identifies peaks in time series and helps to identify the time window of
  the first maximum according to given rules.
}
\usage{
peakwindow(x, y = NULL, xstart = 0, xmax = max(x), minpeak = 0.1, mincut = 0.382)
}

\arguments{
  \item{x, y}{the x (in day of year) and y coordinates of a set of points.
              Alternatively, a single argument x can be provided.}
  \item{xstart}{x value (e.g. time of ice-out) before the maximum value
    of the searched peak (this is a ``weak'' limit),}
  \item{xmax}{maximum of the end of the searched peak (this is a ``hard'' maximum,}
  \item{minpeak}{minimum value of the total maximum which is regarded as peak,}
  \item{mincut}{minimum relative height of a pit compared to the lower of the
    two neighbouring maxima at which these maxima are regarded as separate peaks
    (default value is derived from golden section).}
}
\details{
  This is a heuristic peak detection algorithm. It can be used for two related
  purposes, (i) to identify all relevant peaks within a time-series and (ii)
  to identify the time window which belongs to one single peak (smd = specified mass 
  development, e.g. spring maximum in phytoplankton time series).
}
\value{
  A list with the following elements:
  \item{peaks}{a data frame with the characteristics (index, xleft, x, xright and y)
    of all identified peaks,}
  \item{data}{the original data set (\code{x}, \code{y}),}
  \item{smd.max.index}{index of the maximum value of the ``specified'' peak,}
  \item{smd.max.x}{x-value of the maximum of the ``specified'' peak,}
  \item{smd.indices}{indices (data window) of all data belonging to the ``specified'' peak,}
  \item{smd.x}{x-values (time window) of all data belonging to the ``specified'' peak,}
  \item{smd.y}{corresponding y-values of all data belonging to the ``specified'' peak,}
  \item{peakid}{vector with peak-id-numbers for all data.}
}

\seealso{%\code{\link{dweibull}},
         \code{\link{weibull4}},
         \code{\link{weibull6}},
         \code{\link{fitweibull}},
         \code{\link{CDW}}
         \code{\link{plot.cardiPeakwindow}}
         \code{\link[cardidates:cardidates-package]{cardidates}}
}

\examples{
## generate test data with 3 peaks
set.seed(123)
x <- seq(0, 360, length = 20)
y <- abs(rnorm(20, mean = 1, sd = 0.1))
y[5:10] <- c(2, 4, 7, 3, 4, 2)
y <- c(y, 0.8 * y, 1.2 * y)
x <- seq(0, 360, along = y)
y[6] <- y[7]   # test case with 2 neighbouring equal points

## plot the test data
plot(x, y, type="b")

## identify the "spring mass development"
peaks <- peakwindow(x, y)
ind <- peaks$smd.indices
lines(x[ind], y[ind], col="red", lwd=2)

## now fit the cardinal dates
fit <- fitweibull6(peaks$smd.x, peaks$smd.y)
CDW(fit)
plot(fit)

## some more options ...
peaks <- peakwindow(x, y, xstart=150, mincut = 0.455)
ind <- peaks$smd.indices
lines(x[ind], y[ind], col = "blue")
points(x, y, col = peaks$peakid +1, pch = 16) # all peaks

## work with indices only
peaks <- peakwindow(y)

## test case with disturbed sinus
x<- 1:100
y <- sin(x/5) +1.5 + rnorm(x, sd = 0.2)
peaks <- peakwindow(x, y)
plot(x, y, type = "l", ylim = c(0, 3))
points(x, y, col = peaks$peakid + 2, pch = 16)

## test case: only one peak
yy <- c(1:10, 11:1)
peakwindow(yy)

## error handling test case: no turnpoints
# yy <- rep(1, length(x))
# peakwindow(x, yy)

}
\keyword{ misc }

