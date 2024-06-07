#' Plot the fitted density for the constrained KDE model
#'
#' @param model The fitted model object
#' @param x_seq The sequence of points to estimate the density
#' @return A ggplot object
#' @examples
#' set.seed(42)
#' n <- 100
#' x <- c(rnorm(0.5 * n, 0, 1), rnorm(0.5 * n, 1.5, 1/3))
#' h <- 0.6
#' model <- fit_constrained_kde(x, h)
#' x_seq <- seq(min(x) - 1, max(x) + 1, length.out = 1000)
#' p1 <- plot_constrained_kde_density(model, x_seq)
#' print(p1)
#' ggsave('density_estimate_plot_3moments.png', plot=p1, dpi=300, width=10, height=6)
#' @export
plot_constrained_kde_density <- function(model, x_seq) {
  results <- predict_constrained_kde(model, x_seq)
  density_values <- results$density

  ggplot() +
    geom_line(aes(x=x_seq, y=density_values, color='Estimated Density'), size=1) +
    geom_rug(aes(x=model$x), sides="b") +
    ggtitle('KDE matching first 3 Sample Moments') +
    xlab('x') +
    ylab('Density') +
    scale_color_manual(values=c('blue'), labels=c('Estimated Density')) +
    theme_minimal()
}

#' Plot the weights (stem plot) for each data point in the constrained KDE model
#'
#' @param model The fitted model object
#' @return A ggplot object
#' @examples
#' set.seed(42)
#' n <- 100
#' x <- c(rnorm(0.5 * n, 0, 1), rnorm(0.5 * n, 1.5, 1/3))
#' h <- 0.6
#' model <- fit_constrained_kde(x, h)
#' p2 <- plot_constrained_kde_weights(model)
#' print(p2)
#' ggsave('stem_plot_3moments.png', plot=p2, dpi=300, width=10, height=6)
#' @export
plot_constrained_kde_weights <- function(model) {
  data <- data.frame(x=model$x, weights=model$weights)

  ggplot(data, aes(x=x, y=weights)) +
    geom_segment(aes(xend=x, yend=0), color='black') +
    geom_point(color='black') +
    theme_minimal() +
    labs(x='x', y='Weights p')
}
