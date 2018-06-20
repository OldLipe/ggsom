#' aesthetics data of som object
#
#' @param model_som object of SOM package
#'
#' @param cutree.value number of division grid
#'
#' @import tidyverse
#'
#' @return Model data that is used in plots
#'
#' @export
aes_som <- function(model_som,
                    cutree_value = 0) {
  cutree <- TRUE

  # Check if the variable is a SOMs object
  "%|K|%" (model_som)

  # Wide model with IDs using key and value
  model_som_values <-
    data.frame(
      codes = model_som$data[[1]],
      id = (1:nrow(model_som$data[[1]])),
      unit.class = model_som$unit.classif
    ) %>%
    gather(var, values, -id, -unit.class)

  # Create the model data of points
  model_som_pts <- as.data.frame(model_som$grid$pts)

  model_som_pts$unit.class <- c(1:nrow(model_som$grid$pts))

  value_sum_points <- sum_unit_class(model_som_values)
  model_som_pts$sum <- value_sum_points$sum

  # joining the model of points  of model of values by unit.class column
  if (cutree && cutree_value > 0) {
    # Hierarchical cluster analysis
    model_som_pts$cluster <-
      cutree(hclust(dist(model_som$codes[[1]])), cutree_value)
    model_som_result <-
      left_join(model_som_values, model_som_pts, by = "unit.class")
    return(model_som_result)
  } else {
    model_som_result <-
      left_join(model_som_values, model_som_pts, by = "unit.class")
    return(model_som_result)
  }

}
#' sum_unit_class
#'
#' Sum of each grid the neuron
#'
#' @param model.som.values Model of values that is generate in generate.model.result
#'
#' @return Sum of amount neurons per grid
sum_unit_class <- function(model_som_values) {
  value_result <-
    data.frame(unit.class = c(1:length(unique(
      model_som_values$unit.class
    ))))

  for (value in seq_along(unique(model_som_values$unit.class))) {
    value_result$sum[value] <-
      c(model_som_values[model_som_values$unit.class == value, "values"] %>% length())
  }
  return(value_result)
}
