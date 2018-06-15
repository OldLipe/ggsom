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
#' @return TRUE if cluster in data frame otherwise FALSE
is.cluster <- function(x)
  "cluster" %in% colnames(x)

"%|SCALE|%" <- function(color = FALSE) {
  if (color) {
    scale_fill_gradient(low = "#3498db", high = "#c0392b")
  }
}

"%|COLOR|%" <- function(color, aes_som) {
  if (color) {
    p <- ggplot(aes_som, aes(var, values, group = id, colour = var))
  } else {
    p <- ggplot(aes_som, aes(var, values, group = id))
  }
  return(p)
}


"%|TEXT|%" <- function(text) {
  if (text) {
    t  <- geom_text(aes(y = y,
                        x = x,
                        label = sum), x = 2.9, y = 4.1)
    return(t)
  }
}
