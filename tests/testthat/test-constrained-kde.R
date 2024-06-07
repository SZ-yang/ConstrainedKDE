library(testthat)
library(ConstrainedKDE)

test_that("Constrained KDE model fitting and prediction", {
  set.seed(42)
  n <- 100
  x <- c(rnorm(0.5 * n, 0, 1), rnorm(0.5 * n, 1.5, 1/3))
  h <- 0.6

  model <- fit_constrained_kde(x, h)

  expect_equal(sum(model$weights), 1, tolerance=1e-6)

  x_seq <- seq(min(x) - 1, max(x) + 1, length.out = 1000)
  predictions <- predict_constrained_kde(model, x_seq)

  expect_type(predictions$density, "double")
  expect_type(predictions$moments, "double")

  print(predictions$moments)
})
