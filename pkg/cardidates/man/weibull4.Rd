\name{weibull4}
\alias{weibull4}
\alias{fweibull4}
\alias{aweibull4}
\title{Four-Parametric Weibull Function}
\description{
  Four-parametric Weibull function and its definite integral.
}
\usage{
fweibull4(x, p)

aweibull4(p, lower, upper)
}

\arguments{
  \item{x}{vector of function arguments}
  \item{p}{vector of function parameters with:
    \code{p[1]} vertical shift (zero offset),
    \code{p[2]} vertical scaling,
    \code{p[3]} shape parameter \eqn{a} of \code{\link{dweibull}}, and
    \code{p[4]} scale parameter \eqn{b} of \code{\link{dweibull}},}
  \item{lower}{lower limit of the cumulative (integrated) function}
  \item{upper}{upper limit of the cumulative (integrated) function}
}
\details{
  The four-parametric Weibull function is essentially based on the Weibull
  density function \code{\link{dweibull}} and its integral by the Weibull distribution
  function \code{\link{pweibull}}
  with two additional parameters for y scaling and zero offset. It can be given
  by:
  \deqn{f(x) = p_1 + p_2 (p_3/p_4) {(x/p_4)}^{p_3-1} \exp (-{(x/b)}^{p_3})}{%
        f(x) = p1 + p2 (p3/p4) (x/p4)^(p3-1) exp(- (x/p4)^p3)}
  for \eqn{x \ge 0}.
}
\value{
  \code{fweibull4} gives the Weibull function and \code{aweibull4} its definite
  integral (cumulative sum or area under curve).
}

\seealso{\code{\link{dweibull}},
         %\code{\link{weibull4}},
         \code{\link{weibull6}},
         \code{\link{fitweibull}},
         \code{\link{peakwindow}},
         \code{\link{CDW}},
         \code{\link[cardidates:cardidates-package]{cardidates}}
}

\examples{
x <- seq(0, 5, 0.02)
plot(x, fweibull4(x, c(0, 1, 2, 1)), type="l", ylim=c(0, 2))
points(x, dweibull(x, 2, 1), pch="+") ## identical to former

## shape
lines(x, fweibull4(x, c(0, 2, 1.5, 1)), type="l", col="orange")
## horizontal scaling
lines(x, fweibull4(x, c(0, 2, 2, 2)), type="l", col="green")
## shifting
lines(x, fweibull4(x, c(1, 1, 2, 1)), type="l", col="blue")
## vertical scaling
lines(x, fweibull4(x, c(0, 2, 2, 1)), type="l", col="red")


## definite integral
p <- c(0, 1, 2, 2)
plot(x, aweibull4(p, lower=0, upper = x))

p <- c(0.1, 1, 2, 2)
plot(x, aweibull4(p, lower=0, upper = x))
}
\keyword{ math }
\keyword{ arith }
