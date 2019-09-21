#' @title aesthetics data of som object
#' @name ggsom_aes
#' @author  Felipe Carvalho, \email{lipecaso@@gmail.com} 
#' @references `Kohonen`package (https://CRAN.R-project.org/package=kohonen) and
#' `sits` package (https://CRAN.R-project.org/package=sits)
#'
#' @description Function to join categorical classes and mapping each neuron of SOM 
#' 
#' @param model_som object of self-organising maps (SOMs) - Kohonen package
#' @param class categorical attribute with dataset classes
#' @return Model data that is used in plots
#'
#' @export
ggsom_aes <- function(model_som, class) {
  
  assertthat::assert_that(is.kohonen(model_som))

  # Creating a data frame from the SOMs object
  model_som_values <-
    data.table::data.table(model_som$data[[1]],
                           unit.class = model_som$unit.classif,
                           class,
                           id = (1:nrow(model_som$data[[1]]))) %>%
    .[,sum:=.(.N), by="unit.class"]

  # Creating a data frame from the SOMs object of grid points
  model_som_pts <-
    data.table::data.table(model_som$grid$pts,
                           unit.class = 1:nrow(model_som$grid$pts))

  model_som_values <- model_som_pts[model_som_values, on = 'unit.class']

  return(model_som_values)

}

