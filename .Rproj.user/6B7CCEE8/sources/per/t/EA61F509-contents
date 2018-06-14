plot_ggsom_cluster_line <- function (ggsom){
  "%|C|%"(ggsom)
  ggplot(model.som,  aes(var, values, group = id))  +
    geom_rect(data = ggsom, aes(fill = factor(cluster)),
              xmin = -Inf,
              xmax = Inf,
              ymin = -Inf,
              ymax = Inf,
              alpha=0.3) +
    geom_line()  +
    facet_grid(y ~ x) +
    geom_text(aes(y = y, x = x, label = sum), x = 2.9, y = 4.1) +
    theme_base() +
    theme(strip.background = element_blank(),
          strip.text = element_blank(),
          legend.position = "none",
          axis.title = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank())
}

plot_ggsom_cluster_ribbon <- function(ggsom){
  "%|C|%"(ggsom)
  ggplot(ggsom, aes(var, values, group = id)) +
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

plot_ggsom_cluster_factor <- function(ggsom) {
  "%|C|%"(ggsom)
  ggplot(ggsom, aes(var, values, group = id)) +
    geom_rect(data = ggsom, aes(fill = factor(cluster)),
              xmin = -Inf,
              xmax = Inf,
              ymin = -Inf,
              ymax = Inf,
              alpha=0.3) +
    geom_line() +
    facet_grid(y ~ x) +
    theme_base() +
    theme(strip.background = element_blank(),
          strip.text = element_blank(),
          legend.position = "none",
          axis.title = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank())
}

plot_ggsom_linep <- function (ggsom) {
  "%|C|%"(ggsom)
  ggplot(ggsom, aes(var, values, group = id)) +
    geom_rect(data = ggsom, aes(fill = factor(cluster)),
              xmin = -Inf,
              xmax = Inf,
              ymin = -Inf,
              ymax = Inf,
              alpha=0.3) +
    geom_line() +
    geom_point() +
    facet_grid(y ~ x) +
    geom_text(aes(y = y, x = x, label = sum), x = 3.3, y = 4.1) +
    theme_base() +
    theme(strip.background = element_blank(),
          strip.text = element_blank(),
          legend.position = "none",
          axis.title = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank())
}
