#' Cluster plot using geom rect with color
#'
#' @param ggsom Model of data plot
#'
#' @param text Boolean type to viasualize numbers of neurons per grid
#'
#' @import ggplot2
#'
#' @import ggthemes
#'
#' @return ggplot visualization
#'
#' @export
ggsom_rect <- function (ggsom, text = TRUE) {
  "%|C|%"(ggsom)
  ggplot(ggsom,  aes(var, values, group = id))  +
    geom_rect(
      data = ggsom,
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
