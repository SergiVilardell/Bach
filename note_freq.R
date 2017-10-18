#Note frequency
library(tidyverse)
source("conversion_table.R")

note_freq <-  function(data){

  ct <- conversion_table()  
  a <- data["pitch"]
  a <- apply(a, 1, FUN = function(x) colnames(ct)[which(ct == x , arr.ind = TRUE)[2]])
  data$notes <- a


  b <- data %>% 
    count(pitch) %>%
    arrange(desc(n)) 
  
    
  c <- data %>% 
    count(notes) %>%
    arrange(desc(n)) 
  
  
  #return(plot(b, main = "Chopin's notes (pitch)"))
  return(barplot(c$n, names.arg = c$notes, main = "Chopin's notes"))
}