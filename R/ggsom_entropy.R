#' @title Function to obtain the purity of each neuron in the SOM network
#' @name ggsom_entropy
#' @author Felipe Carvalho, \email{felipe.carvalho@@inpe.br}
#'
#' @importFrom dplyr select group_by summarise mutate right_join everything n
#' @importFrom tidyr gather spread
#'
#' @description Entropy calculation using the maximum likelihood method
#'
#' @param ggsom_aes kohonen package object modeling
#'
#' @return Data set with the purity attribute added in Tibble
ggsom_entropy <- function(ggsom_aes){

  # sum of classes per neuron
  sum_values <- ggsom_aes %>%
    dplyr::select(x,y, class, id, sum) %>%
    dplyr::group_by(x,y,class) %>%
    dplyr::summarise(a = n()/length(unique(ggsom_aes$feature))) %>%
    tidyr::spread(class, a) %>%
    tidyr::gather(classe, valores, -x, -y) %>%
    dplyr::mutate(valores = tidyr::replace_na(valores,0),
                  soma = sum(valores)) %>%
    tidyr::spread(classe, valores)

  # calc entropy
  entropy <- sum_values %>% dplyr::select(everything()) %>%
    tidyr::gather(classe, valores, -x, -y, -soma) %>%
    dplyr::group_by(x, y) %>%
    dplyr::mutate(entropy = entropy::entropy(valores, method = "ML", unit = "log2")) %>%
    tidyr::spread(classe, valores) %>%
    dplyr::select(x, y, entropy) %>%
    dplyr::right_join(ggsom_aes, by=c("x","y"))

  return(entropy)
}
