# R options set globally
options(width = 60)
source(here::here("helper_functions","format_data_frame_as_def_list.R") )
# chunk options set globally
knitr::opts_chunk$set(
  comment = "#>",
  collapse = FALSE
  )

multiplot <- function (..., plotlist = NULL, file, cols = 1, layout = NULL) 
{
  library(grid)
  plots <- c(list(...), plotlist)
  numPlots = length(plots)
  if (is.null(layout)) {
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)), 
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  if (numPlots == 1) {
    print(plots[[1]])
  }
  else {
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), 
                                               ncol(layout))))
    for (i in 1:numPlots) {
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row, 
                                      layout.pos.col = matchidx$col))
    }
  }
}


suppressMessages(
  library(tidyverse)
)
.format_dataframe_as_def_list <- function(
    .data = readRDS(here::here("data","terminology_database.RDS")), 
    chapter=1){
  if(is.numeric(chapter)){
    .data <- .data %>% 
      filter(Chapter==chapter)
  }
  .data <- .data %>% 
    arrange(Term)
  for (i in 1:nrow(.data)){
    cat(.data$Term[i], "\n")
    cat(":   ", .data$Definition[i], "\n")
    
    if(str_length(.data$Formula[i]) > 1){
      cat("    Fórmula:",.data$Formula[i], "\n")  
    }
    if(str_length(.data$R[i]) > 1){
      cat("    Función relevante en R:", paste0("```",.data$R[i], "```."),"\n")  
    }
    cat("    Equivalente en inglés:",paste0("«",.data$English[i], "»."),"\n\n")
  }
  
}


source("helper_functions/box_plot_explanation.R")
source("helper_functions/format_data_frame_as_def_list.R")
source("helper_functions/format_data_frame_with_formulae.R")

