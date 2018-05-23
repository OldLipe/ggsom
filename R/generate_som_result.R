#' generate.model.som
#
#' @param model.som Object of SOM package
#'
#' @param cutree Boolean type to set a cluster visualization
#'
#' @param cutree.value amount of grid cluster
#'
#' @param grid.mark Boolean type to mark amout of neuron in each grid
#'
#'
generate.model.result  <-function(model.som,cutree = FALSE,cutree.value = 0,grid.mark = FALSE){
  # Carregando os pacotes necessários para criar a visualização
  load.packages()

  # Modelo wide com os IDs utilizando chave e valor
  model.som.values <- data.frame(codes=model.som$data[[1]],id=(1:nrow(model.som$data[[1]])),unit.class=model.som$unit.classif) %>%
    gather(var,values,-id,-unit.class)

  # Criando dataframe dos grids
  model.som.pts <- as.data.frame(model.som$grid$pts)

  # Criando unit class de cada grid
  model.som.pts$unit.class <- c(1:nrow(model.som$grid$pts))

  # Juntando os valores que foram passados que parametros
  if (cutree == TRUE && cutree.value >0 && grid.mark == TRUE){
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
#' Sum of each grid of neuron
#'
#'
sum.unit.class <- function(model.som.values){
  value.result = data.frame(unit.class=c(1:length(unique(model.som.values$unit.class))))
  for (value in seq_along(unique(model.som.values$unit.class))){
    value.result$sum[value] <- c(model.som.values[model.som.values$unit.class == value,"values"] %>% length())
  }
  return(value.result)
}
