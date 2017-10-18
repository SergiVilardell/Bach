#Midi notation to notes

conversion_table <- function(){
  
  notes = c("C", "Cs", "D", "Ds",	"E", "F", "Fs", "G", "Gs",	"A",	"As",	"B")

  conversion_table <- data.frame(matrix(vector(), 11, 12,
                                      dimnames=list(c(), notes)),
                               stringsAsFactors=F)
  count <- 0
  for (i in 1:12){
    for(j in 1:12){
    conversion_table[i,j] <- count
    count <- count + 1
   }
  }
 return(conversion_table)
}

