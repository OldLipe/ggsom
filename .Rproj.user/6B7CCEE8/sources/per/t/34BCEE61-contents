#' plot_ggsom_line_point_colour
#'
#' Visualization that is contains amount of neuron per grid with color based on classes
#'
#' @param ggsom Model of data plot
#'
#' @example
#'
#' plot_ggsom_line_point_colour(aes_som(model_som))
#'
#' @return ggplot visualization
#'
#' @export
plot_ggsom_line_point_colour <- function(aes_som){
  ggplot(aes_som, aes(var, values, group = id, colour = var)) +
    geom_line() +
    geom_point() +
    facet_grid(y ~ x) +
    geom_text(aes(y = y, x = x, label = sum), x = 3.2, y = 4.1) +
    theme_base() +
    theme(strip.background = element_blank(),
          strip.text = element_blank(),
          legend.position = "none",
          axis.title = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank())
}
#' plot_ggsom_line_point
#'
#' Visualization that is contains amount of neuron per grid without colors
#'
#' @param ggsom Model of data plot
#'
#' @example
#'
#' plot_ggsom_line_point(aes_som(model_som))
#'
#' @return ggplot visualization
#'
#' @export
plot_ggsom_line_point <- function(ggsom){
  ggplot(ggsom, aes(var, values, group = id)) +
    geom_line() +
    geom_point() +
    facet_grid(y ~ x) +
    geom_text(aes(y = y, x = x, label = sum), x = 3.2, y = 4.1) +
    theme_base() +
    theme(strip.background = element_blank(), strip.text = element_blank(),
          legend.position = "none",
          axis.title = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank())
}
