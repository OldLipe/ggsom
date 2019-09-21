#' @title Time series base visualization on som packages
#' @name ggsom_ts
#' @author  Felipe Carvalho, \email{lipecaso@@gmail.com} 
#' @references `ggplot2` package (https://CRAN.R-project.org/package=ggplot2) 
#'
#' @description View user base for customizing SOM object time series charts
#' 
#' @param ggsom_aes Model generate by ggsom_aes function
#' @param x_axis x-axis of time series
#' @param y_axis y-axis of time series values
#' @param color the time series classes
#' @param x_map the position where the number of samples per class will be marked corresponds to the x axis
#' @param y_map the position at which the number of samples per class will be marked corresponds to the y axis
#' @return ggplot2 class object 
#'
#' @export
ggsom_ts <- function(ggsom_aes, 
                     x_axis = days,
                     y_axis = values,
                     color = reference,
                     x_map = "2017-09-02",
                     y_map = 0.59){
  
  ggplot2::ggplot(ggsom_aes, aes(x = x_axis, y = y_axis, group = id, color = color)) +
  geom_line(size=0.55) +
  facet_grid(y ~ x, labeller=label_parsed) +
  geom_text(aes(
    y = y_map,
    x = as.Date(x_map, "%Y-%m-%d"),
    label = paste("N:", sum)), check_overlap = TRUE,
    show.legend = FALSE,
    colour="black",
    size = 5.5)
}


