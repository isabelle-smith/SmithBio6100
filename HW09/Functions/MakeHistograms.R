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
  
  for (var in vars){
    
    plots[[i]] <- ggplot(data=df, aes(x=paste0(var))) +
      
      geom_histogram()
    
  }
  
  # return line - - - - - - - - - - - - - - - - - - - - -
  return(plots)

} # end of function make_histograms
# --------------------------------------
 make_histograms()
