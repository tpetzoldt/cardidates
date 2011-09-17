\name{merge.cardiMetacdw}
\alias{merge.cardiMetacdw}
\title{
  Merge Two Objects of Class 'cardiMetacdw'
}
\description{
  This is a helper function that can be used to replace or add manually fitted
  cardidates objects to a set of cardidates objects fitted by metaCDW.
  
}
\usage{
\method{merge}{cardiMetacdw}(x, y, ...)
}
\arguments{
  \item{x}{
    the result of a call to metaCDW,
  }
  \item{y}{
    a second object resulting from a call to metaCDW, but which contains one 
    sample only.
  }
  \item{...}{
    not implemented, reserved for future extensions.
  }
}
\details{
  This is a helper function that can be used to add additional fits to an 
  existing object or to replace single fits of a \code{metaCSW} object. 
  Though the function is intended for fine-tuning of problematic samples
  it should not be abused for invalidating the general principles of
  objectivity and reproducibility.
}
\value{
  An object of class 'cardiMetacdw', i.e. a Weibull fit. 
}

\seealso{
  \code{\link{metaCDW}}
}
\examples{
## artificial test data
data(carditest)

## identify all first peaks
fit <- metaCDW(carditest)

## plot it
plot(fit, carditest)

## detect second peak for 'Year2'
sample2 <- subset(carditest, sample == "Year 2")
sample2$sample <- factor(sample2$sample) # drop unused levels
fit2 <- metaCDW(sample2, xstart=150)

## merge results
merged.fit <- merge(fit, fit2)
plot(merged.fit, carditest)
}
\keyword{ misc }
