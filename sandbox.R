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

notes_list <- paste(a, collapse = ' ')

df <-  data.frame(matrix(vector(), 0, 1,
                       dimnames=list(c(), c("notes"))),
                stringsAsFactors=F)

df[1,1] <- notes_list


bigram <- df %>% 
  unnest_tokens(bigram, notes, token = "ngrams", n = 2) %>% 
  count(bigram) %>% 
  arrange(desc(n))

barplot(bigram$n, log = "y", names.arg = bigram$bigram, main = "Bach's notes")

trigram <- df %>% 
  unnest_tokens(trigram, notes, token = "ngrams", n = 3) %>% 
  count(trigram) %>% 
  arrange(desc(n))

fourgram <- df %>% 
  unnest_tokens(fourgram, notes, token = "ngrams", n = 4) %>% 
  count(fourgram) %>% 
  arrange(desc(n))

barplot(fourgram$n, log = "y", names.arg = fourgram$fourgram, main = "Bach's notes")




b <- data %>% 
  count(pitch) %>%
  arrange(desc(n)) 

c <- data %>% 
  count(notes) %>%
  arrange(desc(n)) 


plot(b, main = "Bach's notes (pitch)")
barplot(c$n, names.arg = c$notes, main = "Bach's notes")


