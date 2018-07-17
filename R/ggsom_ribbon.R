#' ggsom_ribbon
#'
#' Cluster plot using geom ribbon with color
#'
#' @param aes_som Function aes_som for input data on plot
#'
#' @param color Boolean type to add color on plot
#'
#' @import ggthemes
#'
#' @import ggplot2
#'
#' @examples
#'
#' \dontrun{
#' library(ggthemes)
#' library(ggsom)
#' library(ggplot2)
#'
#' iris_som <- som(scale(iris[1:4]), grid = somgrid(6, 4, 'rectangular'))
#'
#' ggsom_ribbon(aes_som(iris_som, cutree_value = 3), FALSE)
#' }
#'
#' @return ggplot visualization
#'
#' @export
ggsom_ribbon <- function(aes_som, color) {
    `%|C|%`(aes_som)

  ggplot(aes_som, aes(var, values, group = id)) + geom_ribbon(aes(
    ymin = values,
    ymax = values * 2,
    fill = cluster
  ), alpha = 0.5) + facet_grid(y ~ x) +
    `%|SCALE|%`(color) + theme_few(10) + geom_text(
      aes(y = y, x = x, label = sum),
      x = 3.2,
      y = 9.7,
      size = 4,
      family = "sans",
      fontface = "plain",
      alpha = 0.03
    ) +
    theme(
      strip.background = element_blank(),
      strip.text = element_blank(),
      legend.position = "none",
      axis.title = element_blank(),
      axis.text = element_blank(),
      axis.ticks = element_blank()
    )
}
