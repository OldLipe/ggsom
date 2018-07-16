#' ggsom_line
#'
#' Visualization that is contains amount of neuron per grid with color based on classes
#'
#' @import ggplot2
#'
#' @import ggthemes
#'
#' @param aes_som Function aes_som for input data on plot
#'
#' @param color Boolean to change color of the edges
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
#' ggsom_line(aes_som(iris_som), TRUE)
#' }
#'
#' @return ggplot visualization
#'
#' @export
ggsom_line <- function(aes_som, color) {
  aes_color(color, aes_som) +
    geom_line() +
    geom_point() +
    facet_grid(aes_som$y ~ aes_som$x) +
    geom_text(aes(y = aes_som$y, x = aes_som$x, label = aes_som$sum), x = 3.0, y = 4.8) +
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



