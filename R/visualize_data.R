#' Visualize.cutree
#'
#' Visualization of each cluster using cutree
#'
#'
visualize.cluster <- function(model.som.result,colour = FALSE){
  vis <- ggplot(model.som.result,aes(var,values,group = id))
  + geom_line()
  + geom_point()
  + facet_grid(y~x)
  + geom_text(aes(y=y,x=x,label=sum),x = 3.3, y=4.1)
  + theme_base()
  + theme(strip.background = element_blank(),strip.text = element_blank(),legend.position = "none",
          axis.title = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank())
  + geom_rect(data = model.som.result,aes(fill=cluster),xmin = -Inf,xmax = Inf,ymin = -Inf,ymax = Inf)
  return(vis)
}
visualize.cluster.numbers <- function(model.som.result){
  vis <- ggplot(model.som.result,  aes(var,values,group = id)) + geom_line() + geom_point() + facet_grid(y~x) + geom_text(aes(y=y,x=x,label=sum),x = 3.3, y=4.1) + theme_base() + theme(strip.background = element_blank(),strip.text = element_blank(),legend.position = "none",axis.title = element_blank(),axis.text = element_blank(),axis.ticks = element_blank())+ geom_rect(data = model.som.result,aes(fill=cluster),xmin = -Inf,xmax = Inf,ymin = -Inf,ymax = Inf,alpha=0.4)
  return(vis)

}
visualize.numbers <- function(model.som.result,colour=FALSE){
  if (colour == TRUE){
    vis <- ggplot(model.som.result,aes(var,values,group = id,colour=var)) + geom_line() + geom_point() + facet_grid(y~x) + geom_text(aes(y=y,x=x,label=sum),x = 3.2, y=4.1) + theme_base() + theme(strip.background = element_blank(),strip.text = element_blank(),legend.position = "none",axis.title = element_blank(),axis.text = element_blank(),axis.ticks = element_blank())
  }
  else{
    vis <- ggplot(model.som.result,aes(var,values,group = id)) + geom_line() + geom_point() + facet_grid(y~x) + geom_text(aes(y=y,x=x,label=sum),x = 3.2, y=4.1) + theme_base() + theme(strip.background = element_blank(),strip.text = element_blank(),legend.position = "none",axis.title = element_blank(),axis.text = element_blank(),axis.ticks = element_blank())
  }
  return(vis)
}
