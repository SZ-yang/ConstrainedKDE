% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/constrained_kde_plots.R
\name{plot_constrained_kde_weights}
\alias{plot_constrained_kde_weights}
\title{Plot the weights (stem plot) for each data point in the constrained KDE model}
\usage{
plot_constrained_kde_weights(model)
}
\arguments{
\item{model}{The fitted model object}
}
\value{
A ggplot object
}
\description{
Plot the weights (stem plot) for each data point in the constrained KDE model
}
\examples{
set.seed(42)
n <- 100
x <- c(rnorm(0.5 * n, 0, 1), rnorm(0.5 * n, 1.5, 1/3))
h <- 0.6
model <- fit_constrained_kde(x, h)
p2 <- plot_constrained_kde_weights(model)
print(p2)
}
