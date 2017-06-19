#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# author: Firdaus Afifi
# date: 16 June 2017
# 
#

library(shiny)
library(shinythemes)
library(dplyr)

bigrams_freq <- readRDS("bigrams_freq.RData")
pentgrams_freq <- readRDS("pentgrams_freq.RData")
quadgrams_freq <- readRDS("quadgrams_freq.RData")
trigrams_freq <- readRDS("trigrams_freq.RData")

ui <- fluidPage(
   
  theme = shinytheme("superhero"),  
  
  titlePanel("Coursera Data Science Capstone Project"),h4("by Firdaus Afifi"),br(),
  sidebarLayout(
   
     sidebarPanel(
       titlePanel("Input word"),
       textInput(inputId = "text",label = " ", placeholder = "Enter text here")
      
    ),
    
    sidebarPanel(
      titlePanel("Predict word"),
      textOutput(outputId = "output1"),textOutput(outputId = "output2"),textOutput(outputId = "output3"),textOutput(outputId = "output4")
      
      
    ) 
    
  
  
    ),tags$img(src= "logo.png") 
  )

server <- function(input, output) {
    
    output$output4 <- renderText({
    
      req(input$text)  
      sampletext <- input$text
      # input 4 word
      sampletext4 <- tail(strsplit(sampletext,split = " ")[[1]],4)           # select last 4 word
      sampletext4 <- paste(sampletext4, collapse = ' ')                      # combine word
      sampletext4 <- paste('^', sampletext4, sep = "")                       # put ^ infront string
      out1 <- pentgrams_freq[grep(pentgrams_freq[,1],pattern = sampletext4),]# search for match
      # output
      out1 <- arrange(out1,desc(frequency))
      if(!nrow(out1)){
        " "
      } else{
        out1$word<- as.character(out1$word)
        tail(strsplit(out1[1,1],split = " ")[[1]],1)
        }
    })
    
    output$output3 <- renderText({
      req(input$text)
      sampletext <- input$text 
      # input 3 word
      sampletext3 <- tail(strsplit(sampletext,split = " ")[[1]],3)           # select last 3 word
      sampletext3 <- paste(sampletext3, collapse = ' ')                      # combine word
      sampletext3 <- paste('^', sampletext3, sep = "")                       # put ^ infront string
      out1 <- quadgrams_freq[grep(quadgrams_freq[,1],pattern = sampletext3),]# search for match
      # output
      out1 <- arrange(out1,desc(frequency))
      if(!nrow(out1)){
        " "
      } else{
        out1$word<- as.character(out1$word)
      tail(strsplit(out1[1,1],split = " ")[[1]],1)
      }
    })
    
    output$output2 <- renderText({
      req(input$text)
      sampletext <- input$text 
      # input 2 word
      sampletext2 <- tail(strsplit(sampletext,split = " ")[[1]],2)          # select last 2 word
      sampletext2 <- paste(sampletext2, collapse = ' ')                     # combine word
      sampletext2 <- paste('^', sampletext2, sep = "")                      # put ^ infront string
      out1 <- trigrams_freq[grep(trigrams_freq[,1],pattern = sampletext2),] # search for match
      # output
      out1 <- arrange(out1,desc(frequency))
      if(!nrow(out1)){
        " "
      } else{out1$word<- as.character(out1$word)
      tail(strsplit(out1[1,1],split = " ")[[1]],1)
      }
    })
    
    output$output1 <- renderText({
      req(input$text)
      sampletext1 <- input$text
      #input 1 word
      sampletext1 <- tail(strsplit(sampletext1,split = " ")[[1]],1)          # select last 1 word
      sampletext1 <- paste('^', sampletext1, sep = "")                      # put ^ infront string
      out1 <- bigrams_freq[grep(bigrams_freq[,1],pattern = sampletext1),]   # search for match
      sampletext1 # sample 1
  
      #sampletext0 <- head(strsplit(sampletext,split = "")[[1]],1)
      #out1 <- unigrams_freq[grep(unigrams_freq[,1],pattern = sampletext0),]
    
      # output
      out1 <- arrange(out1,desc(frequency))
      if(!nrow(out1)){
        " "
      } else{
      out1$word<- as.character(out1$word)
      tail(strsplit(out1[1,1],split = " ")[[1]],1)
      }
    })
    output$test <- renderText({sampletext <- input$text 
    tail(strsplit(sampletext,split = " ")[[1]],1)
    })
}


shinyApp(ui = ui, server = server)

