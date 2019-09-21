#' @title Verify if objects inherits kohonen object
#' @name is.kohonen
#' @author  Felipe Carvalho, \email{lipecaso@@gmail.com}
#' @references `Kohonen`package (https://CRAN.R-project.org/package=kohonen)
#'
#' @description if object inherits kohonen class return TRUE otherwise stop
#'
#' @param data Boolean type to generate plot of timeseries
#' @return Boolean value
is.kohonen <- function(data) inherits(data, "kohonen")
