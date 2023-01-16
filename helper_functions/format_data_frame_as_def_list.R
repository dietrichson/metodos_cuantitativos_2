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