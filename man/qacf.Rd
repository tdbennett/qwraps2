% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/qacf.R
\name{qacf}
\alias{qacf}
\title{Autocorrelation plot}
\usage{
qacf(x, conf_level = 0.95, show_sig = FALSE, ...)
}
\arguments{
\item{x}{object}

\item{conf_level}{confidence level for determining \sQuote{sigificant}
correlations.}

\item{show_sig}{logical, highlight significant correlations.}

\item{...}{Other arguments passed to stats::acf}
}
\value{
a ggplot.
}
\description{
TO BE CONSTRUCTED
}
\details{
TO DO
}
\examples{
# Generate a random data set
set.seed(42)
n <- 250
x1 <- x2 <- x3 <- x4 <- vector('numeric', length = n)
x1[1] <- runif(1)
x2[1] <- runif(1)
x3[1] <- runif(1)
x4[1] <- runif(1)

# white noise
Z.1 <- rnorm(n, 0, 1)
Z.2 <- rnorm(n, 0, 2)
Z.3 <- rnorm(n, 0, 5)

for(i in 2:n)
{
	x1[i] <- x1[i-1] + Z.1[i] - Z.1[i-1] + x4[i-1] - x2[i-1]
	x2[i] <- x2[i-1] - 2 * Z.2[i] + Z.2[i-1] - x4[i-1]
	x3[i] <- x3[i-1] + x2[i-1] + 0.2 * Z.3[i] + Z.3[i-1]
	x4[i] <- x4[i-1] + runif(1, 0.5, 1.5) * x4[i-1]
}
testdf <- data.frame(x1, x2, x3, x4)

# Base acf plot for one variable
acf(testdf$x1)

# qacf plot for one variable
qacf(testdf$x1)
qacf(testdf$x1, show_sig = TRUE)

# more than one variable
acf(testdf)
qacf(testdf)
qacf(testdf, show_sig = TRUE)

}

