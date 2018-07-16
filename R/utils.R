"%|K|%" <- function(a) {
  if (!is.kohonen(a))
    stop(
      deparse(substitute(a)),
      " needs to be ",
      paste0("kohonen object.", collapse = ", "),
      call. = FALSE
    )
  else
    TRUE
}

#' Check if the object is inherits of kohonen
#'
#' @param x Dataframe
#'
#' This is used by aes_som to simplify comparison between objects
#'
#' @return if object inherits kohonen class return TRUE otherwise stop
is.kohonen <- function(x)
  inherits(x, "kohonen")



"%|C|%" <- function(x) {
  if (!is.cluster(x))
    stop("To view plot cluster method need to set number of clusters.",
         call. = FALSE)
}

#' Check if the parameter has a cluster column
#'
#' @param x Dataframe
#'
#' @return TRUE if cluster in data frame otherwise FALSE
is.cluster <- function(x)
  "cluster" %in% colnames(x)


"%|SCALE|%" <- function(color = FALSE) {
  if (color) {
    scale_fill_gradient(low = "#3498db", high = "#c0392b")
  }
}


"%|CUTREE|%" <- function(list_params) {
  ifelse ("cutree_value" %in% names(list_params) &&
            list_params$cutree_value > 0,
          TRUE,
          FALSE)
}


#' aes_color
#'
#' Function that return the base plot with or without color
#'
#' @param aes_som Function aes_som for input data on plot
#'
#' @param color Boolean type to adding color on plot
#'
#' @return Base plot
aes_color <- function(color, aes_som) {
  ifelse(color, return(ggplot(
    aes(
      aes_som$var,
      aes_som$values,
      group = aes_som$id,
      colour = aes_som$var,
      data = aes_som
    )
  )), return(ggplot(aes_som, aes(
    aes_som$var,
    aes_som$values,
    group = aes_som$id
  ))))
}

"%|CLUSTER|%" <- function(model_som) {
  ifelse ("cluster" %in% names(model_som), TRUE, FALSE)

}

"%|TEXT|%" <- function(a = TRUE, aes_som) {
  if (a) {
    t  <- geom_text(aes(y = aes_som$y,
                        x = aes_som$x,
                        label = aes_som$sum), x = 2.9, y = 4.1)
    return(t)
  }
}
