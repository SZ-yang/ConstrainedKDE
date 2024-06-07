#' Fit the constrained kernel density estimation model with moment constraints
#'
#' @param x The data points
#' @param h The bandwidth for the kernel density estimation
#' @return A list containing the weights, lambda, and other parameters
#' @examples
#' set.seed(42)
#' n <- 100
#' x <- c(rnorm(0.5 * n, 0, 1), rnorm(0.5 * n, 1.5, 1/3))
#' h <- 0.6
#' model <- fit_constrained_kde(x, h)
#' print(model)
#' @export
fit_constrained_kde <- function(x, h) {
  compute_weights <- function(x, h) {
    n <- length(x)
    lambda <- c(0.37704664, -0.0025,  0.014, 0.014)
    lambda <- gauss_newton(lambda, x, h)
    T <- sapply(0:3, function(j) sapply(x, T_j, j=j, h=h))
    final_weights <- 1 / rowSums(sweep(T, 2, lambda, "*"))
    final_weights <- final_weights / sum(final_weights)
    list(weights=final_weights, lambda=lambda)
  }

  gauss_newton <- function(lambda, x, h, r=3, tol=1e-10, max_iter=100000) {
    T <- sapply(0:r, function(j) sapply(x, T_j, j=j, h=h))
    target_moments <- c(1, t_j(x, 1), t_j(x, 2), t_j(x, 3))
    for (i in 1:max_iter) {
      p <- 1 / rowSums(sweep(T, 2, lambda, "*"))
      p <- p / sum(p)
      V <- colSums(p * T) - target_moments
      J <- -crossprod(T, (p^2) * T)
      residual <- sum(V^2)
      delta_lambda <- solve(J, crossprod(J, V))
      lambda <- lambda - 0.00001 * delta_lambda
      if (residual < tol) {
        break
      }
    }
    lambda
  }

  results <- compute_weights(x, h)
  list(weights=results$weights, lambda=results$lambda, x=x, h=h)
}

#' Predict density and moments using the fitted constrained KDE model
#'
#' @param model The fitted model object
#' @param x_seq The sequence of points to estimate the density
#' @return A list containing density estimates and first four moments
#' @examples
#' set.seed(42)
#' n <- 100
#' x <- c(rnorm(0.5*n, 0, 1), rnorm(0.5 * n, 1.5, 1/3))
#' h <- 0.6
#' model <- fit_constrained_kde(x, h)
#' x_seq <- seq(min(x) - 1, max(x) + 1, length.out = 1000)
#' predictions <- predict_constrained_kde(model, x_seq)
#' print(predictions$density)
#' print(predictions$moments)
#' @export
predict_constrained_kde <- function(model, x_seq) {
  density_estimate <- function(x_seq, data, weights, h) {
    n <- length(data)
    density <- numeric(length(x_seq))
    for (i in seq_along(x_seq)) {
      u <- (x_seq[i] - data) / h
      density[i] <- sum(weights * biweight_kernel(u)) / h
    }
    density
  }

  density_values <- density_estimate(x_seq, model$x, model$weights, model$h)
  first_moment_3 <- trapz(x_seq, x_seq * density_values)
  second_moment_3 <- trapz(x_seq, x_seq^2 * density_values)
  third_moment_3 <- trapz(x_seq, x_seq^3 * density_values)
  fourth_moment_3 <- trapz(x_seq, x_seq^4 * density_values)

  list(density=density_values, moments=c(first_moment_3, second_moment_3, third_moment_3, fourth_moment_3))
}
