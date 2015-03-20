---
title: "Code Book"
author: "JustinDBeck"
date: "Friday, March 20, 2015"
output: html_document
---

# Code Book

This file describes the steps undertaken to tidy the data provided and summarise the contents of the tidy data. 

The data is the "Human Activity Recognition Using Smartphones Dataset - Version 1.0". Further information is available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones with the specific data file having been downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  on 14 March 2015. 

The data file is placed in an R working directory and then the run_analysis.R script is run. This unzips the data and undertakes processing as described in the R file itself. 

The resulting output of this R script is a file called "tidyDataMeans.txt" which contains floating point numbers representing the means or standard deviations of the various measurements:

The first index column corresponds to the index of the experiment subject
The second index column corresponds to the index of the activity undertaken
The remaining columns contain the mean value over all experiements for each subject/activity pair
Each of these columns corresponds to a type of measurement, for each of the following categories there is both a mean and a std column:

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag


In total this is 66 columns of data in addition to the two indexing columns.
