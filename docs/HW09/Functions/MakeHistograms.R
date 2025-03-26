# --------------------------------------
# FUNCTION make_histograms
# required packages: ggplot2
# description: Generate histograms for both Abundance and Species Richness (S) and store the plots
# inputs: data.frame with richness & abundance
# outputs: two histograms (list)
########################################
make_histograms <- function(df=NULL){
  
  library(ggplot2)
  
  # assign parameter defaults - - - - - - - - - - - - - -
  if (is.null(df)) {
    
    df <- data.frame(richness = rpois(10,8),
                     abundance = rpois(10,9))
  }
  
  # calculations - - - - - - - - - - - - - - - - - - - - -
  vars <- c("richness", "abundance")
  fills <- scales::hue_pal()(2)
  plots <- vector("list", 2)
  
  for (i in 1:length(vars)){
    
    var <- sym(vars[i])
    col <- fills[i]
    
    plots[[i]] <- ggplot(data=df, aes(x={{var}})) + ## https://github.com/tidyverse/ggplot2/issues/5155
      
      geom_histogram(fill=col)
    
  }
  
  # return line - - - - - - - - - - - - - - - - - - - - -
  return(plots)

} # end of function make_histograms
# --------------------------------------
 make_histograms()
