---
title: "CodeBook.md"
author: "mrysio"
date: "02/14/2015"
output: html_document
---

The aim of this CodeBook is to clarify and describe my work that modifies and updates the codebooks available with the data to indicate all the variables and summaries I  have calculated, along with units, and any other relevant information

For information about the input data see:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
==============================================================================

Things I have changed:

- Add labels to the data set with descriptive variable names.

- Using descriptive activity names I have named the activities in the data set.
   1 -> WALKING
   2 -> WALKING_UPSTAIRS
   3 -> WALKING_DOWNSTAIRS
   4 -> SITTING
   5 -> STANDING
   6 -> LAYING)    
   
- Summarize the data: calculating the average of each variable for each activity and 
  each subject.
  So measurements are still bounded within [-1,1] but in my tida data it is now the
  average size of each variable for each activity and subject.     


For your convenience I have also described (using comments) any transformations or work that I performed to clean up the data in the script run_analysis along with the code.I find it much more useful and practical. What is more, it is consistent with up-to-date approach to programming documentation. 
