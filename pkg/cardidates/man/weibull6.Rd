\name{weibull6}
\alias{weibull6}
\alias{fweibull6}
\alias{aweibull6}
\title{Six-Parametric Weibull Function}
\description{
  Six-parametric Weibull function and its definite integral.
}
\usage{
fweibull6(x, p)

aweibull6(p, lower = 0, upper = 365)
}

\arguments{
  \item{x}{vector of function arguments}
  \item{p}{vector of function parameters with:
    \code{p[1]} determines the offset before increase \eqn{ofs = (p[4]+1) * (1-p[1])},
    \code{p[2]} inflexion point of increasing branch,
    \code{p[3]} steepness of increasing branch,
    \code{p[4]} offset after the peak,
    \code{p[5]} inflexion point of decreasing branch,
    \code{p[6]} steepness of decreasing branch,}
  \item{lower}{lower limit of the cumulative (integrated) function,}
  \item{upper}{upper limit of the cumulative (integrated) function.}
}

\details{
  The six-parametric Weibull function is more flexible than the four-parametric
  version. It is possible to have different offsets before and after the peak.
  The function can be given by:
  \deqn{f(x) = p_4 + \exp(-(x/p_5)^{p_6})) (1-p_1 * \exp(-(x/p_2)^{p_3}))}{%
        f(x) = (p4 + exp(-(x/p5)^p6)) (1-p1 * exp(-(x/p2)^p3))}
  for \eqn{x \ge 0}.
}
\value{
  \code{fweibull6} gives the function and \code{aweibull6} its definite
  integral (cumulative function or area under curve). Note that
  in contrast to \code{\link{aweibull4}}, the integral is
  solved numerically and that the function returns a scalar, not a vector.
}
\seealso{%\code{\link{dweibull}},
         \code{\link{weibull4}},
         %\code{\link{weibull6}},
         \code{\link{fitweibull}},
         \code{\link{CDW}},
         \code{\link{peakwindow}},
         \code{\link[cardidates:cardidates-package]{cardidates}}
         \code{\link{Vectorize}}
}

\examples{
x <- seq(0, 150)
plot(x, fweibull6(x, c(0.833, 40, 5, 0.2, 80, 5)), type = "l", ylim = c(0,2))

## interpretation of offsets
ofs1 <- 0.1
ofs2 <- 0.3
p1 <- 1-ofs1/(ofs2 + 1)

lines(x, fweibull6(x, c(p1, 20, 5, ofs2, 60, 5)), col = "red")

## definite integratel from zero to 150, returns scalar
aweibull6(c(p1, 20, 5, ofs2, 60, 5), lower = 0, upper = 150)

## use Vectorize to create vectorized functions
vec.aweibull6 <- Vectorize(aweibull6, "upper")
plot(x, vec.aweibull6(c(p1, 20, 5, ofs2, 60, 5), lower = 0, upper = x))
}
\keyword{ math }
\keyword{ arith }
