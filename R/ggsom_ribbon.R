#' Cluster plot using geom ribbon with color
#'
#' @param ggsom Model of data plot
#'
#' @param color Boolean type to add color on plot
#'
#' @return ggplot visualization
#'
#' @export
ggsom_ribbon <- function(ggsom, color) {
  "%|C|%"(ggsom)

  ggplot(ggsom, aes(var, values, group = id)) +
    geom_ribbon(aes(
      ymin = values,
      ymax = values * 2,
      fill = cluster
    ), alpha = .5) +
    facet_grid(y ~ x) +
    "%|SCALE|%" (color) +
    theme_few(10) +
    geom_text(
      aes(y = y, x = x, label = sum),
      x = 3.2,
      y = 9.7,
      size = 4,
      family = "sans",
      fontface = "plain",
      alpha = .03
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
