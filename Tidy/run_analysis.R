# Analysis Script for Course Project:
#
##Getting and Cleaning Data
# by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
#
# Script by Justin Beck
# Created 17 March 2015
#

# assume the zip is available in the current directory. 

# Unzip the data if necessary - first check if it has already been unzippe
if(!file.exists("UCI HAR Dataset")) {
  unzip("getdata_projectfiles_UCI HAR Dataset.zip")
}

if (!exists("xTest")) {
# Load the data if it isn't already in the workspace (saves time on repeats)
xTest <- read.table("UCI HAR Dataset//test//X_test.txt")
xTrain <- read.table("UCI HAR Dataset//train//X_train.txt")
yTest <- read.table("UCI HAR Dataset//test//y_test.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjectsTest <- read.table("UCI HAR Dataset//test//subject_test.txt")
subjectsTrain <- read.table("UCI HAR Dataset//train//subject_train.txt")
labels <- read.table("UCI HAR Dataset//features.txt")
activites <- read.table("UCI HAR Dataset/activity_labels.txt")
}

# find the elements with "-mean()" or "-std()" in their label
indices <- grepl("-mean\\(",labels[,2]) | grepl("-std\\(",labels[,2])

# select those subsets (Assignment Part 2)
subxTest <- xTest[,indices]
subxTrain <- xTrain[,indices]
sublabels <- labels[indices,]

# merge test with train (Assignment part 1)
allData <- rbind(subxTest,subxTrain)

# add column labels (Assignment Part 4)
colnames(allData)<-sublabels[,2]

# add descriptions to the activity index (Assignment Part 3)
testActivites <- merge(yTest,activites,by.x="V1",by.y="V1",sort=FALSE)
trainActivities <- merge(yTrain,activites,by.x="V1",by.y="V1",sort=FALSE)
combinedActivities <- rbind(testActivites,trainActivities)
colnames(combinedActivities) <- c("Activity_Index","Activity_Name")

# add the subjects and activity indexes and labels to the data
combinedSubjects <- rbind(subjectsTest,subjectsTrain)
colnames(combinedSubjects) <- c("Subject_Index")

# Add the row indexes/labels (Assignment Part 4)
tidyData <- cbind(combinedSubjects,combinedActivities,allData)

# do the grouping and averaging by Subject_Index and Activity_Index (Assignment Part 5)
library(plyr) # load required package - assumes already installed
tidyDataMeans <- ddply(tidyData[,-3],.(Subject_Index,Activity_Index),colMeans)


# write the output in desired format
write.table(tidyDataMeans,"tidyDataMeans.txt",row.name=FALSE)


