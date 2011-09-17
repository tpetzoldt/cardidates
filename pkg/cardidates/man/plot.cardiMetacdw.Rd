\name{plot.cardiMetacdw}
\alias{plot.cardiMetacdw}

\title{Plot Method for cardiPeakwindow Objects}
\description{
  This function is intended to visualize peaks identified
  by the metaCDW function.
}
\usage{
\method{plot}{cardiMetacdw}(x, y, type = "lattice", scale = TRUE, col.poly = "black", ...)
}

\arguments{
  \item{x}{an object of class \code{cardiMetacdw} resulting from a call
    to \code{\link{CDW}},}
  \item{y}{the original data which were supplied to
  \code{\link{CDW}},}
  \item{type}{either "lattice" or "polygon",}
  \item{scale}{a logical value indicating whether the height of
  polygons should be scaled relative to the highest peak,}
  \item{col.poly}{color of polygons, either a single numeric value
  for all years or a vector of the same length as number of samples,}
  \item{\dots}{other arguments passed to \code{xyplot} or \code{plot}.}
}

\details{
  This is a top-level function to plot a complete set of
  fits resurned by \code{\link{metaCDW}} together with the original data points.
  The function requires the \pkg{lattice} package.
}

\seealso{\code{\link{peakwindow}},
         \code{\link{CDW}}
         \code{\link{metaCDW}}
         \code{\link[cardidates:cardidates-package]{cardidates}}
}


\examples{
## artificial test data
data(carditest)

## identify all peaks
tt <- metaCDW(carditest)

## plot it;
plot(tt, carditest)

## or with alternate layout:
plot(tt, carditest, layout = c(1, 3))

## plot polygons
plot(tt, carditest, type = "polygon")
}

\keyword{ hplot }
\keyword{ methods }
