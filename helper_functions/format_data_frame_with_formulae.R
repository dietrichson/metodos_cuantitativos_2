#' Format data.frame with fomulae
#'
#' Formats a data.frame with formulae to markdown while preserving the formulae.
#' 
#' @param .data data.frame
#' @param caption table caption
#' @param label character string
#' @param col.names 
#' @return
#' @export
.format_data_frame_with_formulae_as_table <- 
  function(.data, caption='No caption', label="no-label",
                                                      col.names = NULL){
  label <- paste0("tab:",label)
  if(is.null(col.names)) col.names <- names(.data)
  cat("| ")
  cat(paste0(col.names,collapse='| '))
  cat(" |\n")
  for (i in 1:length(col.names)) 
    cat("|--- ")
  cat(" |\n")
  
  for (i in 1:nrow(.data)){
    cat("| ")
    cat(paste0(.data[i,], collapse=" |"))
    cat(" |\n")
    
  }
  cat(paste0("Table: (\\#", label,") ",caption,"\n"))
  #cat("Table: (\\#tab:label2) Caption2")
}