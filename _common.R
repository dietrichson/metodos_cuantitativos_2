# example R options set globally
options(width = 60)
source(here::here("helper_functions","format_data_frame_as_def_list.R") )
# example chunk options set globally
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
