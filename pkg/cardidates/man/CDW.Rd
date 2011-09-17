\name{CDW}
\alias{CDW}
\alias{CDWa}
\title{Cardinal Dates Using Fitted Weibull Curves}
\description{
  CDW (cardinal dates using Weibull curves) extracts ``cardinal dates'' from
  fitted four- and six-parametric Weibull curves.
}
\usage{
CDW(p, xmin = 0, xmax = 365, quantile = 0.05, symmetric = FALSE)

CDWa(p, xmin = 0, xmax = 365, quantile = 0.05, symmetric = FALSE)
}

\arguments{
  \item{p}{object of class \code{cardiFit} returned by \code{\link{fitweibull6}} or
    \code{\link{fitweibull4}} or parameter vector of the fitted Weibull function,}
  \item{xmin}{left boundary (in day of year) of the integral under the curve,}
  \item{xmax}{right boundary (in day of year) of the integral under the curve,}
  \item{quantile}{two-sided quantile (percentage of integral)
       which defines beginning and end of the peak,}
  \item{symmetric}{if (\code{TRUE}), quantiles are calculated for the whole area
       under the curve, otherwise for each of the branches separately.}
}
\details{
  \code{CDW} is a numerically improved version of the algorithm
  described in Rolinski et al. (2007). Version \code{CDWa} is an alternative,
  simplified version which sets the baseline before and after the peak to zero
  using appropriate offset parameters \code{p[1]} and \code{p[4]}. 
  The original method described by Rolinski et al. 2007 (here called \code{CDW})
  shifts the function for the left and right branch separately
  in the asymmetric case.
}
\value{
   A list with components:
  \item{x}{x values of cardinal dates \code{tMid}, \code{tBegin}, \code{tEnd},}
  \item{y}{the corresponding y values (divided by ymax),}
  \item{p}{parameters of the fitted Weibull function}
}

\seealso{%\code{\link{dweibull}},
         \code{\link{weibull4}},
         \code{\link{weibull6}},
         \code{\link{fitweibull}},
         \code{\link{peakwindow}},
         %\code{\link{CDW}},
         \code{\link{metaCDW}},
         \code{\link[cardidates:cardidates-package]{cardidates}}
}


\examples{
## create some test data
set.seed(123)
x <- seq(0, 360, length = 20)
y <- abs(rnorm(20, mean = 1, sd = 0.1))
y[5:10] <- c(2, 4, 7, 3, 4, 2)

## fit Weibull function with 6 free parameters
res <- fitweibull6(x, y)

## show some properties
res$r2
p <- res$p
o <- res$fit
f <- res$ymax

## identify cardinal dates from fitted curves
(smd  <- CDW(p))
(smda <- CDW(p, symmetric = FALSE))

## plot data, curve and cardinal dates
plot(x, y, ylim=c(0, 10), xlim = c(0, 365))
lines(o$x, o$f * f)
points(x, fweibull6(x, p) * f, col = "green")
points(smd$x, fweibull6(smd$x, p) * f, col = "orange", pch = 16)
points(smda$x, fweibull6(smda$x, p) * f, col = "red", pch = 1, cex = 1.2)

## for comparison: additional fit of a 4 parameter Weibull
res4  <- fitweibull4(x, y)
res4$r2
p <- res4$p
o <- res4$fit
f <- res4$ymax
smd  <- CDW(p)
lines(o$x, o$f * f, col = "blue")
points(smd$x, fweibull4(smd$x, p) * f, col = "blue", pch = 16)
}

\keyword{ misc }

