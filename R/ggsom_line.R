#' plot_ggsom_line_point_colour
#'
#' Visualization that is contains amount of neuron per grid with color based on classes
#'
#' @import ggplot2
#'
#' @import ggthemes
#'
#' @param ggsom Model of data plot
#'
#' @param color Boolean to change color of the edges
#'
#' @return ggplot visualization
#'
#' @export
ggsom_line <- function(aes_som, color) {
  "%|COLOR|%"(color, aes_som) +
    geom_line() +
    geom_point() +
    facet_grid(y ~ x) +
    geom_text(aes(y = y, x = x, label = sum), x = 3.0, y = 4.8) +
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



