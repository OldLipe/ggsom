#' generate.model.som
#
#' @param model.som Object of SOM package
#'
#' @param cutree Boolean type to set of cluster visualization
#'
#' @param cutree.value Pieces of division grid
#'
#' @param grid.mark Boolean type to mark amount of neuron in each grid
#'
#' @return Model data that is used in plots
#'
#' @export
generate.model.result  <-function(model.som,cutree = FALSE,cutree.value = 0,grid.mark = FALSE){
  # Load the necessary packages to create a visualization
  load.packages()

  # Wide model with IDs using key and value
  model.som.values <- data.frame(codes=model.som$data[[1]],id=(1:nrow(model.som$data[[1]])),unit.class=model.som$unit.classif) %>%
    gather(var,values,-id,-unit.class)

  # Create the model data of points
  model.som.pts <- as.data.frame(model.som$grid$pts)

  model.som.pts$unit.class <- c(1:nrow(model.som$grid$pts))

  # joining the model of points  of model of values by unit.class column
  if (cutree && cutree.value >0 && grid.mark){
    value.sum.points <- sum.unit.class(model.som.values)
    model.som.pts$sum <- value.sum.points$sum
    model.som.pts$cluster <- cutree(hclust(dist(model.som$codes[[1]])), cutree.value)
    model.som.result <- left_join(model.som.values,model.som.pts,by="unit.class")
    return(model.som.result)
  }
  else{
    model.som.result <- left_join(model.som.values,model.som.pts,by="unit.class")
  }
  return(model.som.result)
}


#' Sum.unit.class
#'
#' Sum of each grid the neuron
#'
#' @param model.som.values Model of values that is generate in generate.model.result
#'
#' @return Sum of amount neurons per grid
#'
sum.unit.class <- function(model.som.values){
  value.result = data.frame(unit.class=c(1:length(unique(model.som.values$unit.class))))
  for (value in seq_along(unique(model.som.values$unit.class))){
    value.result$sum[value] <- c(model.som.values[model.som.values$unit.class == value,"values"] %>% length())
  }
  return(value.result)
}
