
set.seed(100)
library(knitr)
library(stringi)
library(tm)
library(RWeka)
library(dplyr)
library(ggplot2)
library(SnowballC)


blogs<-readLines(con = "en_US.blogs.txt",encoding = "UTF-8")
twitter<-readLines(con = "en_US.twitter.txt",encoding = "UTF-8")
news<-readLines(con = "en_US.news.txt",encoding = "UTF-8")

## Clean the data
blogs <- iconv(blogs, "latin1", "ASCII", sub="")
news <- iconv(news, "latin1", "ASCII", sub="")
twitter <- iconv(twitter, "latin1", "ASCII", sub="")

## Sampling the data
sample_blogs <- sample(blogs,size =1/100*length(blogs)) 
sample_news<- sample(news,size =1/100*length(news)) 
sample_twitter <- sample(twitter,size =1/100*length(twitter)) 

## clear space
remove(blogs)
remove(news)
remove(twitter)

## Combine all the subsample into one sample
sample_total <- c(sample_blogs,sample_news,sample_twitter)

## clear space
remove(sample_blogs)
remove(sample_news)
remove(sample_twitter)

## Corpus Creation
corpus <- VCorpus(VectorSource(sample_total))
corpus <- tm_map(corpus, tolower)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, stripWhitespace)
#corpus <- tm_map(corpus, removeWords, stopwords("english"))
#corpus <- tm_map(corpus, stemDocument) 
corpus <- tm_map(corpus, PlainTextDocument)

## N-Grams Analysis - time
unigram_tokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 1, max = 1))
bigram_tokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))
trigram_tokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 3, max = 3))
quadgram_tokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 4, max = 4))
pentgram_tokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 5, max = 5))

unigrams <- TermDocumentMatrix(corpus, control = list(tokenize = unigram_tokenizer))
bigrams <- TermDocumentMatrix(corpus, control = list(tokenize = bigram_tokenizer))
trigrams <- TermDocumentMatrix(corpus, control = list(tokenize = trigram_tokenizer))
quadgrams  <- TermDocumentMatrix(corpus, control = list(tokenize = quadgram_tokenizer))
pentgrams <- TermDocumentMatrix(corpus, control = list(tokenize = pentgram_tokenizer))

## N-grams Frequency
unigrams_freqTerm <- findFreqTerms(unigrams,lowfreq = 5)
bigrams_freqTerm <- findFreqTerms(bigrams,lowfreq=10)
trigrams_freqTerm <- findFreqTerms(trigrams,lowfreq=6)
quadgrams_freqTerm <- findFreqTerms(quadgrams,lowfreq=3)
pentgrams_freqTerm <- findFreqTerms(pentgrams, lowfreq = 2)

## Unigram frequency dataframe
unigrams_freq <- rowSums(as.matrix(unigrams[unigrams_freqTerm,]))
unigrams_freq <- data.frame(word=names(unigrams_freq), frequency=unigrams_freq)
head(unigrams_freq)
save(unigrams_freq, file="unigrams_freq.RData")

## Bigram frequency dataframe
bigrams_freq <- rowSums(as.matrix(bigrams[bigrams_freqTerm,]))
bigrams_freq <- data.frame(word=names(bigrams_freq), frequency=bigrams_freq)
head(bigrams_freq)
save(bigrams_freq, file="bigrams_freq.RData")

## Trigram frequency dataframe
trigrams_freq <- rowSums(as.matrix(trigrams[trigrams_freqTerm,]))
trigrams_freq <- data.frame(word=names(trigrams_freq), frequency=trigrams_freq)
head(trigrams_freq)
save(trigrams_freq, file="trigrams_freq.RData")

## Quadgram frequency dataframe
quadgrams_freq <- rowSums(as.matrix(quadgrams[quadgrams_freqTerm,]))
quadgrams_freq <- data.frame(word=names(quadgrams_freq), frequency=quadgrams_freq)
head(quadgrams_freq)
save(quadgrams_freq, file="quadgrams_freq.RData")

## Pentgram frequency dataframe
pentgrams_freq <- rowSums(as.matrix(pentgrams[pentgrams_freqTerm,]))
pentgrams_freq <- data.frame(word=names(pentgrams_freq), frequency=pentgrams_freq)
head(pentgrams_freq)
save(pentgrams_freq, file="pentgrams_freq.RData")

##out1[,1]which(out1$frequency=16)


#summarise_each(out1, funs(max(., na.rm = TRUE)))
#max(out1$frequency)
