\name{aweibull7}
\alias{aweibull7}
\alias{fweibull7}

\title{Six-Parametric Weibull Function with Additive Shift}
\description{
   A special version of the six-parametric Weibull function
   which has a 7th parameter for additive vertical shifting.
   It is intended mainly for internal use.
}
\usage{
fweibull6(x, p)

aweibull7(p, lower = 0, upper = 365)
}
\arguments{
  \item{x}{vector of function arguments}
  \item{p}{vector of function parameters, see \code{\link{weibull6}} for
    an explanation of parameters \code{p[1]} \dots \code{p[6]};
     \code{p[7]} is an additive constant.}
  \item{lower}{lower limit of the cumulative (integrated) function,}
  \item{upper}{upper limit of the cumulative (integrated) function.}
}
\details{
   The function is intended for
   internal use, i.e. for separate area calculations of the left and right branches.
}
\value{
  \code{fweibull7} gives the function and \code{aweibull7} its definite
  integral (cumulative function or area under curve). Note that
  integration is done numerically and that the function returns a
  scalar, not a vector.
}
\seealso{\code{\link{weibull6}},
         \code{\link{fitweibull}},
         \code{\link{CDW}},
         \code{\link[cardidates:cardidates-package]{cardidates}}
}

\keyword{math}
\keyword{internal}
