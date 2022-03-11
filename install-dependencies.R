#' Script to install dependencies for the project.
#' 
#' @author "Aleksander Dietrichson"
my_dependencies <- 
  c(
    "rmarkdown",
    "bookdown", 
    "grid", 
    "here", 
    "knitr", 
    "tidyverse", 
    "rmarkdown", 
    "bayestestR", 
    "sn", 
    "ggthemes", 
    "mvtnorm",
    "xfun",
    "devtools",
    "usethis",
    "usethat",
    "downlit"
    )
to_install <-
  my_dependencies[which(!my_dependencies %in% installed.packages())]
lapply(to_install,\(x){
  install.packages(x)
})
