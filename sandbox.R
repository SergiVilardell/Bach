library(tidyverse)
source("conversion_table.R")


data <-  read.csv("Bach.txt", sep = " ")
colnames(data) <- c("onset.t", "onset.sec",
                    "pitch", "duration.t", "duration.sec", "channel",
                    "track")

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


plot(b, main = "Bach's notes (pitch)")
barplot(c$n, names.arg = c$notes, main = "Bach's notes")


