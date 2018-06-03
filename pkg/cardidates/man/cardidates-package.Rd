\encoding{latin1}
\name{cardidates-package}
\alias{cardidates-package}
\alias{cardidates}
\docType{package}

\title{
\packageTitle{cardidates}
}

\description{
\packageDescription{cardidates}
}

\details{

The DESCRIPTION file:
\packageDESCRIPTION{cardidates}

Phenology and seasonal succession in aquatic ecosystems are strongly
dependent on physical factors. In order to promote investigations
into this coupling, objective and relible methods of characterising
annual time series are important.

The proposed methods were developed within the AQUASHIFT research program
and used to determine the beginning, maximum
and end of the spring mass development of phytoplankton in different lakes
and water reservoirs. These time points, which we call ``cardinal dates'',
can be analysed for temporal trends and relationships to climate variables.

The complete methodology is described in Rolinski et. al (2007).
Until now we implemented only the most reliable approach using Weibull-Functions
(Method B in the article), other algorithms may follow when required.

The methodology may also be useful for other ecological time series
(e.g. small mammals or insects). Please don't hesitate to contact the package maintainer
if you feel that this package should be generalized to other processes.
}
\author{
  Susanne Rolinski (original algorithm),
  Thomas Petzoldt and Ren\enc{é}{e} Sachse (package and documentation).

Maintainer: Thomas Petzoldt <thomas.petzoldt@tu-dresden.de>
}
\references{
Rolinski, S., Horn, H., Petzoldt, T. & Paul, L. (2007): Identification of cardinal
dates in phytoplankton time series to enable the analysis of long-term trends.
Oecologia \bold{153}, 997 - 1008. \doi{10.1007/s00442-007-0783-2}.

Wagner, A., H\enc{ü}{ue}lsmann, S., Paul, L., Paul, R. J., Petzoldt, T.,
Sachse, R., Schiller, T., Zeis, B., Benndorf, J. & Berendonk, T. U. (2012):
A phenomenological approach shows a high coherence of warming patterns in
dimictic aquatic systems across latitude- Marine Biology \bold{159}(11),
2543-2559. \doi{10.1007/s00227-012-1934-5}.

}
\seealso{%\code{\link{dweibull}},
         \code{\link{weibull4}},
         \code{\link{weibull6}},
         \code{\link{fitweibull}},
         \code{\link{peakwindow}},
         \code{\link{CDW}},
         \code{\link{metaCDW}}
}

\examples{
########## quick start for the impatient ###############
## create some test data
set.seed(123)
x <- seq(0, 360, length = 20)
y <- abs(rnorm(20, mean = 1, sd = 0.1))
y[5:10] <- c(2, 4, 7, 3, 4, 2)

## fit Weibull function with 6 free parameters
res <- fitweibull6(x, y)
plot(res)
summary(res)

################## more details #########################

## show some properties
res$r2
p <- res$p
o <- res$fit
f <- res$ymax

## identify cardinal dates from fitted curves
(smd  <- CDW(p))
(smda <- CDW(p, symmetric = FALSE))

## plot data, curve and cardinal dates
plot(x, y, ylim = c(0, 10), xlim = c(0, 365))
lines(o$x, o$f * f)
points(x, fweibull6(x, p) * f, col = "green")
points(smd$x, smd$y * f, col = "orange", pch = 16)

## or, alternatively:
points(smda$x, fweibull6(smda$x, p) * f, col = "red", pch = 1, cex = 1.2)

## for comparison: fit of a 4 parameter Weibull
res4  <- fitweibull4(x, y)
res4$r2
p <- res4$p
o <- res4$fit
f <- res4$ymax
smd  <- CDW(p)
lines(o$x, o$f * f, col = "blue")
points(smd$x, fweibull4(smd$x, p) * f, col = "blue", pch = 16)

}

\keyword{ package }
