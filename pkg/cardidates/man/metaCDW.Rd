\name{metaCDW}
\alias{metaCDW}
\alias{summary.cardiMetacdw}

\title{Extract Cardinal Dates of Multiple Time Series at Once Using Fitted Weibull Curves}
\description{
  \code{metaCDW} determines the relevant peak of 
  several time series and fits four- resp. six-parametric 
  Weibull curves to these peaks of all series at once and extracts ``cardinal dates'' from
  the fitted curves. 
}
\usage{
metaCDW(dat, method = "weibull6", xstart = 55, xmin = 0, xmax = 365, 
        minpeak = 0.1, mincut = 0.382,
        quantile = 0.05, symmetric = FALSE, p0 = NULL, linint = -1, 
        findpeak = TRUE, maxit = 2000)
\method{summary}{cardiMetacdw}(object, file="", ...)
}

\arguments{
  \item{dat}{a \code{data.frame} containig the columns: 
    \code{sample} (description of the timeseries such as year, water body, or any 
      other code (should be numeric or factor),
      \code{x} (the independend variable, e.g. Julian day of the year),
      \code{y} (the dependend variable, e.g. phytoplankton biovolume)
      and an optional column \code{flag} (of type \code{boolean} indicating whether
      a data point should be included in analysis),}
  \item{method}{either "weibull6" or "weibull4",}
  \item{xstart}{offset (day of year) for the "spring" peak; either a single 
    numeric value for all years or a vector of the same length as number of samples,}
  \item{xmin}{left boundary (in day of year) of the integral under the curve,}
  \item{xmax}{right boundary (in day of year) of the integral under the curve,}
  \item{quantile}{two-sided quantile (percentage of integral)
       which defines beginning and end of the peak,}
  \item{minpeak}{minimum value of the total maximum which is regarded as peak
                 (default value is derived from golden section),}
  \item{mincut}{minimum relative height of a pit compared to the lower of the
    two neighbouring maxima at which these maxima are regarded as separate peaks.}       
  \item{symmetric}{if (\code{TRUE}), quantiles are calculated for the whole area
       under the curve, otherwise for each of the branches separately.}
  \item{p0}{initial parameters for optimization. In case of \code{p0 = NULL}
    a heuristic algorithm to derive initial values is used for \code{fitweibull6},}
  \item{linint}{control parameter to select interpolation behavior.
    Negative values (default) specify automatic selection heuristic,
    zero disables interpolation. A positive value is interpreted as mandatory
    interpolation time step.}
  \item{maxit}{maximum number of iterations passed to the optimisation functions,}
  \item{findpeak}{a logical value indicating whether the relevant peaks of the time series
     should be identified automatically with \code{\link{peakwindow}} 
     before the computation proceeds,}
  \item{object}{a result from a call to \code{\link{metaCDW}},}
  \item{file}{file name where the data are to be written to, defaults to screen,}
  \item{...}{other parameters of \code{summary} passed to \code{write}.}
}
\details{
  This is a top-level function which calls \code{\link{peakwindow}},
  \code{\link{fitweibull}} and
  \code{\link{CDW}} for a series of data sets and returns
  a table (\code{data frame}) of all results.
  
}
\value{
  A list with components:
  \item{metares}{data frame with cardinal dates and fitted parameters, 
    see  \code{\link{CDW}} for details,}
  \item{weibullfits}{list of fit details for all fits, 
    see \code{\link{fitweibull}} for details.}
}
\seealso{%\code{\link{dweibull}},
         \code{\link{weibull4}},
         \code{\link{weibull6}},
         \code{\link{fitweibull}},
         \code{\link{peakwindow}},
         \code{\link{CDW}},
         %\code{\link{metaCDW}},
         \code{\link[cardidates:cardidates-package]{cardidates}}
}

\examples{

## open test data set (3 years) with 4 columns
## sample, x, y, flag
data(carditest)
dat <- carditest

## alternatively: import data from spreadsheet via the clipboard
# dat <- read.table("clipboard", sep = "\t", header = TRUE)

## or, for languages with comma as decimal separator:
# dat <- read.table("clipboard", sep = "\t", header = TRUE, dec = ",")

## Note: as.numeric recodes factor year to numeric value
plot(as.numeric(dat$sample)*365 + dat$x, dat$y, type = "b")

## do the analysis
tt <- metaCDW(dat, xstart = 55)

## plot results
par(mfrow=c(1, 3))
lapply(tt$weibullfits, plot)

## return table of results
summary(tt)

\dontrun{
## copy to clipboard in spreadsheet compatible format
summary(tt, file = "clipboard", sep = "\t", quote = FALSE, row.names = FALSE)

## or, for languages with comma as decimal separator:
#summary(tt, file = "clipboard", sep = "\t", dec = ",",
#  quote = FALSE, row.names = FALSE)
}
}
\keyword{misc}
\keyword{optimize}

