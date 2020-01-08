#' @title Visualization in parallelels coordinates in matrix of each attribute
#' @name geom_class
#' @author  Felipe Carvalho, \email{lipecaso@@gmail.com}
#' @references `ggplot2` package (https://CRAN.R-project.org/package=ggplot2)
#'
#' @description Visualization of the classes corresponding to each neuron of the SOM
#'
#' @import ggplot2
#' @importFrom assertthat assert_that
#'
#' @param object_som object of Kohonen package
#' @param class      categorical vector corresponding to the class of the dataset
#' @param x_o        x-axis to map the number of observations of each neuron
#' @param y_o        y-axis to map the number of observations of each neuron
#' @param x_e        x-axis to map the entropy of each neuron
#' @param y_e        y-axis to map the entropy of each neuron
#' @return ggplot2 object
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Creating SOM object
#' iris_som <- kohonen::som(X = as.matrix(iris[1:4]),
#'                          grid =  kohonen::somgrid(xdim = 5,
#'                                                    ydim = 5,
#'                                                    neighbourhood.fct = "gaussian",
#'                                                    topo = "rectangular"),
#'                          rlen = 100)
#'
#' # Creating ggsom class plot
#' geom_class(iris_som, class = iris$Species,
#'            x_o = 1, y_o = 6,
#'            x_e = 1.1, y_e = 7.4)
#' }
geom_class <- function(object_som,
                     class = NULL,
                     x_o   = 3,
                     y_o   = 5.5,
                     x_e   = 3,
                     y_e   = 6.3){


  assertthat::assert_that(!is.null(class),
                          msg = "geom_class: you should pass a vector
                          corresponding to the classes of your dataset.")

  # Criação do conjunto de dados
  ggsom_model <- ggsom_aes(object_som = object_som, class = class) %>%
    tibble::as_tibble() %>%
    tidyr::gather(feature, values, -sum, -id, -x, -y, -unit.class, -class) %>%
    ggsom_entropy()

  # ggsom plot
  ggsom_graph <- ggplot2::ggplot(ggsom_model, aes(x = feature, y = values, group = id, color = class)) +
    geom_line(size=0.55) +
    facet_grid(y ~ x, labeller=label_parsed) +
    theme(plot.title = element_text(hjust= 0.5,
                                    margin = margin(b = 7)),
          axis.text.x = element_text(angle = 90)) +
    guides(colour = guide_legend(override.aes = list(size = 2))) +
    geom_text(aes(
      y = y_o,
      x = x_o,
      label = paste("N:", sum)), check_overlap = TRUE,
      show.legend = FALSE,
      colour="black", size = 4.0) +
    geom_text(aes(
      y = y_e,
      x = x_e,
      label = paste("E:",round(entropy, 1))), check_overlap = TRUE,
      show.legend = FALSE,
      colour="black",
      size = 3.8)

  return(ggsom_graph)
}

