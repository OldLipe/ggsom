assert <- function(variavel, classe) {
  if (!is.null(variavel)) {
    if (!class(variavel) %in% classe) {
      stop(deparse(substitute(variavel)), " precisa ser ",
           paste0(classe, collapse = ", "), call. = FALSE)
    }
  }
}

"%||%" <- function(a, b) {
  if (!is.null(a)) a else b
}

"%|K|%" <- function(a) {
  if (!is.kohonen(a)) stop(deparse(substitute(a)), " needs to be ",
                           paste0("kohonen object.", collapse = ", "), call. = FALSE) else TRUE
}

is.kohonen <- function(x) inherits(x, "kohonen")


"%|C|%" <- function(x){
  if (!is.cluster(x)) stop("To view plot cluster method need to set number of clusters.", call. = FALSE)
}

is.cluster <- function(x) "cluster" %in% colnames(x)
