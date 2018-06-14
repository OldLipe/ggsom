plot_cluster_ribbon_color <- function(ggsom){
  "%|C|%"(ggsom)

  ggplot(ggsom, aes(var, values, group = id)) +
    geom_ribbon(aes(ymin = values, ymax = values*2, fill = cluster), alpha = .5) +
    facet_grid(y ~ x) +
    scale_fill_gradient(low = "#3498db", high = "#c0392b") +
    theme_few(10) +
    geom_text(aes(y = y, x = x, label = sum),
              x = 3.2,
              y = 9.7,
              size = 4,
              family = "sans",
              fontface = "plain",
              alpha = .03) +
    theme(strip.background = element_blank(),
          strip.text = element_blank(),
          legend.position = "none",
          axis.title = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank())
}

plot_cluster_ribbon <- function(ggsom){
  "%|C|%"(ggsom)
  geom_ribbon(aes(ymin = values, ymax = values*2, fill = cluster), alpha = .5) +
    facet_grid(y ~ x) +
    theme_few(10)  +
    geom_text(aes(y = y, x = x, label = sum),
              x = 3.2,
              y = 9.7,
              size = 4,
              family = "sans",
              fontface = "plain",
              alpha = .03) +
    theme(strip.background = element_blank(),
          strip.text = element_blank(),
          legend.position = "none",
          axis.title = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank())
}
