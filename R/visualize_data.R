#' Visualize.cluster
#'
#' Visualization of each cluster using cutree
#'
#' @param model.som.result Model of data plot
#'
#' @param factor Boolean data type to set a different colours in plot
#'
#' @return ggplot visualization
#'
#'@export
visualize.cluster <- function(model.som.result,factor=FALSE){
  if (factor){
    vis <- ggplot(model.som,  aes(var,values,group = id))  + geom_rect(data = model.som,aes(fill=factor(cluster)),xmin = -Inf,xmax = Inf,ymin = -Inf,ymax = Inf,alpha=0.3) + geom_line()  + facet_grid(y~x) + theme_base() + theme(strip.background = element_blank(),strip.text = element_blank(),legend.position = "none",axis.title = element_blank(),axis.text = element_blank(),axis.ticks = element_blank())
  }
  else{
    vis <- ggplot(model.som,  aes(var,values,group = id))  + geom_rect(data = model.som,aes(fill=cluster),xmin = -Inf,xmax = Inf,ymin = -Inf,ymax = Inf,alpha=0.3) + geom_line()  + facet_grid(y~x) + theme_base() + theme(strip.background = element_blank(),strip.text = element_blank(),legend.position = "none",axis.title = element_blank(),axis.text = element_blank(),axis.ticks = element_blank())
  }
  return(vis)
}
#' visualize.cluster.numbers
#'
#' Visualization of each cluster using cutree and each amount of neuron per grid
#'
#' @param model.som.result Model of data plot
#'
#' @return ggplot visualization
#'
#' @export
visualize.cluster.numbers <- function(model.som.result){
  vis <- ggplot(model.som,  aes(var,values,group = id))  + geom_rect(data = model.som,aes(fill=factor(cluster)),xmin = -Inf,xmax = Inf,ymin = -Inf,ymax = Inf,alpha=0.3) + geom_line()  + facet_grid(y~x) + geom_text(aes(y=y,x=x,label=sum),x = 3.3, y=4.1) + theme_base() + theme(strip.background = element_blank(),strip.text = element_blank(),legend.position = "none",axis.title = element_blank(),axis.text = element_blank(),axis.ticks = element_blank())
  return(vis)
}
#' visualize.numbers
#'
#' Visualization amount of neuron per grid
#'
#' @param model.som.result Model of data plot
#'
#' @param colour  Boolean data type to set colours in plot
#'
#' @return ggplot visualization
#'
#'@export
visualize.numbers <- function(model.som.result,colour=FALSE){
  if (colour){
    vis <- ggplot(model.som.result,aes(var,values,group = id,colour=var)) + geom_line() + geom_point() + facet_grid(y~x) + geom_text(aes(y=y,x=x,label=sum),x = 3.2, y=4.1) + theme_base() + theme(strip.background = element_blank(),strip.text = element_blank(),legend.position = "none",axis.title = element_blank(),axis.text = element_blank(),axis.ticks = element_blank())
  }
  else{
    vis <- ggplot(model.som.result,aes(var,values,group = id)) + geom_line() + geom_point() + facet_grid(y~x) + geom_text(aes(y=y,x=x,label=sum),x = 3.2, y=4.1) + theme_base() + theme(strip.background = element_blank(),strip.text = element_blank(),legend.position = "none",axis.title = element_blank(),axis.text = element_blank(),axis.ticks = element_blank())
  }
  return(vis)
}
