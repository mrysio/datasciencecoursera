---
title: "README.md"
author: "mrysio"
date: "02/14/2015"
output: html_document
---

## The purpose of this project is to demonstrate ability to collect, work with, and
## clean a data set. The goal is to prepare tidy data that can be used for later
## analysis.

This repo includes:

1) R script called run_analysis.R - script for performing the analysis from beginning to the end, the output of this script is the tidy data 

2) A code book called CodeBook.md - describes the variables, the data, and any transformations or work that I performed to clean up the data

3) A readme file called README.md - a file that you reading now, its purpose is to help you to grasp the gist of the project and now how to move within files

You should first take a look on CodeBook and then you can move on to the run_analysis script.


Quick explanation what the analysis file do
===============================================================================

Download,unzip and read into R data sets and:

1. Merges the training and the test sets to create one data set.

2. Appropriately labels the data set with descriptive variable names.

3. Extracts only the measurements on the mean and standard deviation for
   each measurement. 

4. Uses descriptive activity names to name the activities in the data set.
   (i.e. 1 -> "WALKING")

5. Creates independent tidy data set with the average of each variable for
   each activity and each subject.
       
