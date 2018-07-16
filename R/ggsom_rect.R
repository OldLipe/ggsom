#' Cluster plot using geom rect with color
#'
#' @param aes_som Function aes_som for input data on plot
#'
#' @param text Boolean type to viasualize numbers of neurons per grid
#'
#' @import ggplot2
#'
#' @import ggthemes
#'
#' @examples
#'
#' \dontrun{
#' library(ggthemes)
#' library(ggsom)
#' library(ggplot2)
#'
#' iris_som <- som(scale(iris[1:4]), grid = somgrid(6, 4, "rectangular"))
#'
#' ggsom_rect(aes_som(iris_som, cutree_value = 3), TRUE)
#'
#' }
#'
#' @return ggplot visualization
#'
#' @export
ggsom_rect <- function (aes_som, text = TRUE) {
  "%|C|%"(aes_som)
  ggplot(aes_som,  aes(var, values, group = id))  +
    geom_rect(
      data = aes_som,
      aes(fill = factor(cluster)),
      xmin = -Inf,
      xmax = Inf,
      ymin = -Inf,
      ymax = Inf,
      alpha = 0.3
    ) +
    geom_line()  +
    facet_grid(y ~ x) +
    "%|TEXT|%" (text) +
    theme_base() +
    theme(
      strip.background = element_blank(),
      strip.text = element_blank(),
      legend.position = "none",
      axis.title = element_blank(),
      axis.text = element_blank(),
      axis.ticks = element_blank()
    )
}
