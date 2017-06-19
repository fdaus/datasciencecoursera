##out1[,1]which(out1$frequency=16)


setwd("C:/Users/Firdaus/Desktop/R")
#load("C:/Users/Firdaus/Desktop/R/bigrams_freq.RData")
#load("C:/Users/Firdaus/Desktop/R/pentgrams_freq.RData")
#load("C:/Users/Firdaus/Desktop/R/quadgrams_freq.RData")
#load("C:/Users/Firdaus/Desktop/R/trigrams_freq.RData")
#load("C:/Users/Firdaus/Desktop/R/unigrams_freq.RData")

saveRDS(bigrams_freq,"C:/Users/Firdaus/Desktop/R/bigrams_freq.RData")
saveRDS(pentgrams_freq,"C:/Users/Firdaus/Desktop/R/pentgrams_freq.RData")
saveRDS(quadgrams_freq,"C:/Users/Firdaus/Desktop/R/quadgrams_freq.RData")
saveRDS(trigrams_freq,"C:/Users/Firdaus/Desktop/R/trigrams_freq.RData")

sampletext = "how"






  
  
  # input 4 word
  sampletext4 <- tail(strsplit(sampletext,split = " ")[[1]],4)           # select last 4 word
  sampletext4 <- paste(sampletext4, collapse = ' ')                      # combine word
  sampletext4 <- paste('^', sampletext4, sep = "")                       # put ^ infront string
  out1 <- pentgrams_freq[grep(pentgrams_freq[,1],pattern = sampletext4),]# search for match
  sampletext4  # sample 4
  
if(!nrow(out1))
  { 
  # input 3 word
  sampletext3 <- tail(strsplit(sampletext,split = " ")[[1]],3)           # select last 3 word
  sampletext3 <- paste(sampletext3, collapse = ' ')                      # combine word
  sampletext3 <- paste('^', sampletext3, sep = "")                       # put ^ infront string
  out1 <- quadgrams_freq[grep(quadgrams_freq[,1],pattern = sampletext3),]# search for match
  sampletext3 # sample 3
  
}  else if(!nrow(out1)){ 
  # input 2 word
  sampletext2 <- tail(strsplit(sampletext,split = " ")[[1]],2)          # select last 2 word
  sampletext2 <- paste(sampletext2, collapse = ' ')                     # combine word
  sampletext2 <- paste('^', sampletext2, sep = "")                      # put ^ infront string
  out1 <- trigrams_freq[grep(trigrams_freq[,1],pattern = sampletext2),] # search for match
  sampletext2 # sample 2
  
  }else if(!nrow(out1)){  
  #input 1 word
  sampletext1 <- tail(strsplit(sampletext,split = " ")[[1]],1)          # select last 1 word
  sampletext1 <- paste('^', sampletext1, sep = "")                      # put ^ infront string
  out1 <- bigrams_freq[grep(bigrams_freq[,1],pattern = sampletext1),]   # search for match
  sampletext1 # sample 1
  }else{
    sampletext0 <- head(strsplit(sampletext,split = "")[[1]],1)
    out1 <- unigrams_freq[grep(unigrams_freq[,1],pattern = sampletext0),]
  }
# output
out1 <- arrange(out1,desc(frequency))
out1$word<- as.character(out1$word)
tail(strsplit(out1[1,1],split = " ")[[1]],1)

