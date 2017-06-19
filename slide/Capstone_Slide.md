Coursera Data Science Capstone Project
========================================================
author: Firdaus Afifi
date: 16 June 2017
autosize: true
The application is the capstone project for the Coursera Data Science specialization held by Johns Hopkins University and in cooperation with SwiftKey. 

![alt text](logo.png)

Objective
========================================================


The main goal of this capstone project is to build a shiny application that is able to predict the next word.

This exercise was divided into three sub tasks like data cleansing, exploratory analysis and the creation of a predictive model.

All text data that is used to create a frequency dictionary and thus to predict the next words comes from a corpus called [HC Corpora](https://web-beta.archive.org/web/20160930083655/http://www.corpora.heliohost.org/aboutcorpus.html).

All text mining and natural language processing was done with the usage of a variety of well-known R packages.

Methods & Models
========================================================


After creating a data sample from the HC Corpora data, this sample was cleaned by conversion to lowercase, removing punctuation, links, white space, numbers and all kinds of special characters. This data sample was then [tokenized](http://en.wikipedia.org/wiki/Tokenization_%28lexical_analysis%29) into so-called [n-grams](http://en.wikipedia.org/wiki/N-gram).

<i>In the fields of computational linguistics and probability, an n-gram is a contiguous sequence of n items from a given sequence of text or speech.</i> ([Source](http://en.wikipedia.org/wiki/N-gram))

Those aggregated bigram, trigram, quadgram and pentgram term frequency matrices have been transferred into frequency dictionaries.

The resulting data.frames are used to predict and suggest few next words in connection with the text input by user.

Application 
========================================================

The user interface of this application was designed with <b>Mobile Compatibility</b> in mind. <br>While entering the text (<b>1</b>), the field with the predicted suggest words (<b>2</b>) refreshes instantaneously and also the whole text input (<b>3</b>) gets displayed.

![alt text](app.png)

Credits
========================================================



The next word prediction app is hosted on shinyapps.io: https://fdaus.shinyapps.io/capstone_word_prediction_app/

The whole code of this application, as well as all the milestone report, related scripts, this presentation etc. can be found in this GitHub repo: https://github.com/fdaus/datasciencecoursera

This pitch deck is located here: https://rpubs.com/firdaus/word_prediction

Learn more about the Coursera Data Science Specialization: https://www.coursera.org/specializations/jhu-data-science/
