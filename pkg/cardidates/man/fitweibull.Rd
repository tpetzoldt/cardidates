\name{fitweibull}
\alias{fitweibull}
\alias{fitweibull6}
\alias{fitweibull4}

\title{Fit Four or Six Parametric Weibull Functions}
\description{
  Fit a four- or six-parametric Weibull function to environmental data.
}
\usage{
fitweibull6(x, y = NULL, p0 = NULL, linint = -1, maxit=2000)

fitweibull4(x, y = NULL, p0 = c(0.1, 50, 5, 100), linint = -1, maxit=1000)
}

\arguments{
  \item{x, y}{the x (in day of year) and y coordinates of a set of points.
              Alternatively, a single argument x can be provided.}
  \item{p0}{initial parameters for optimization. In case of \code{p0 = NA}
    a heuristic algorithm to derive initial values is used for \code{fitweibull6}.}
  \item{linint}{control parameter to select interpolation behavior.
    Negative values (default) specify automatic selection heuristic,
    zero disables interpolation. A positive value is interpreted as mandatory
    interpolation time step.}
   \item{maxit}{maximum number of iterations passed to the optimisation functions}
}
\details{
  Function \code{fitweibull6} uses extensive heuristics to derive initial parameters
  for the optimization. It is intended to work with data which are defined over an
  interval between 0 and 365, e.g. environmental data and
  especially for plankton blooms.
  Please note that the function does internal transformation:
  \deqn{y_{rel} = y_i / y_{max}}{y_{rel} = y_i / y_{max}}
  
  Note that additional data points are inserted between original measurements
  by linear interpolation with time step = 1 before curve fitting if the number
  of original data points is too low (currently n < 35).
  You can set \code{linint = 0} to switch interpolation off.
  
  \code{fitweibull4} has only built-in heuristics for data interpolation but not
  for guessing initial parameters which must be supplied as
  vector \code{p0} in the call.
}
\value{
  A list with components:
  \item{p}{vector of fitted parameters,}
  \item{ymax}{maximum y value used for transformation,}
  \item{r2}{coefficient of determination between transformed and fitted y values,}
  \item{fit}{data frame with the following columns:
    \itemize{
      \item{x}{data (original or interpolated) used for curve fitting}
      \item{y}{data (transformed-original or interpolated) used for curve fitting}
      \item{f}{estimated function values}
    }
  }
}
\author{
Susanne Rolinski (original functions) and Thomas Petzoldt (package).

Maintainer: Thomas Petzoldt <thomas.petzoldt@tu-dresden.de>
}
\references{
Rolinski, S., Horn, H., Petzoldt, T., & Paul, L. (2007): Identification of cardinal
dates in phytoplankton time series to enable the analysis of long-term trends.
Oecologia \bold{153}, 997 - 1008. \url{http://dx.doi.org/10.1007/s00442-007-0783-2}.
}

\note{Note that the heuristics works optimal if unnecessary leading and trailing
 data are removed before the call.
}
\seealso{%\code{\link{dweibull}},
         \code{\link{weibull4}},
         \code{\link{weibull6}},
         %\code{\link{fitweibull}},
         \code{\link{CDW}}
         \code{\link{peakwindow}},
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

## fit 6 parameter Weibull with user-provided start parameters

x <- seq(0, 150)
y <- fweibull6(x, c(0.8, 40, 5, 0.2, 80, 5)) + rnorm(x, sd = 0.1)
plot(x, y)
res <- fitweibull6(x, y, p0 = c(0, 40, 1, 1, 60, 0))
plot(res)
}

\keyword{nonlinear}
\keyword{optimize}
