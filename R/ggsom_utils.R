#' @title verifies that the object inherits kohonen object
#' @name is.kohonen
#' @author  Felipe Carvalho, \email{lipecaso@@gmail.com}
#' @references `Kohonen`package (https://CRAN.R-project.org/package=kohonen)
#'
#' @description if object inherits kohonen class return TRUE otherwise FALSE
#'
#' @import kohonen
#'
#' @param object_som object of Kohonen package
#' @return Boolean value
is.kohonen <- function(object_som) inherits(object_som, "kohonen")
