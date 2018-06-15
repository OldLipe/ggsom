# ggsom
ggplot extension to visualizate Soms data

## Installing Requirements
```r
  install.packages("kohonen")
  
  # The easiest way to get ggplot2 is to install the whole tidyverse:
  install.packages("tidyverse")
  
  install.packages("dplyr")
  install.packages("ggthemes")
```
## Usage

```r
   
  NBA <-  read.csv(text = getURL("https://raw.githubusercontent.com/clarkdatalabs/soms/master/NBA_2016_player_stats_cleaned.csv"), sep = ",", header = T, check.names = FALSE) %>% colnames()
  
  # Chosing columns
  NBA.measures1 = c("FTA", "2PA", "3PA")
  
  # Defining the som model
  nba.som <- som(scale(NBA[NBA.measures1]), grid = somgrid(6, 4, "rectangular"))
  

```
- Full code can be find [here](https://clarkdatalabs.github.io/soms/SOM_NBA)

## Build the model used in plot function
```r
  model.som <- generate.model.result(nba.som,cutree=TRUE,
                      cutree.value = 2,
                      grid.mark = TRUE)

```
## Examples of plot

```r
  

```
