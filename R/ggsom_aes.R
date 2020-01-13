#' @title kohonen package object modeling
#' @name ggsom_aes
#' @author  Felipe Carvalho, \email{lipecaso@@gmail.com}
#' @references `Kohonen`package (https://CRAN.R-project.org/package=kohonen)
#'
#' @description Function to map each SOM neuron with its corresponding class
#'
#' @param object_som object of kohonen package
#' @param class      categorical vector corresponding to the class of the dataset
#'
#' @return data.table model used in visualizations
#'
#' @export
ggsom_aes <- function(object_som, class) {

  assertthat::assert_that(is.kohonen(object_som))

  # creating a data frame from the SOMs object
  model_som_values <-
    data.table::data.table(object_som$data[[1]],
                           unit.class = object_som$unit.classif,
                           class,
                           id = (1:nrow(object_som$data[[1]]))) %>%
    .[,sum:=.(.N), by="unit.class"]

  # creating a data frame from the SOMs object of grid points
  model_som_pts <-
    data.table::data.table(object_som$grid$pts,
                           unit.class = 1:nrow(object_som$grid$pts))

  # joining the grid points with the SOM object information
  model_som_values <- model_som_pts[model_som_values, on = 'unit.class']

  return(model_som_values)

}






















