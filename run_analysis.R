# set working path 
setwd("~/Documents/DataScience/datasciencecoursera/Cleaning data/UCI HAR Dataset")

# TASK 1 Merges the training and the test sets to create one data set

# read training data 
train_subject <- read.table("./train/subject_train.txt", sep="")
train_X <- read.csv("./train/X_train.txt", sep="", header=FALSE)
train_y <- read.table("./train/y_train.txt", sep="")
type <- rep("train", dim(train_subject)[1])

trainData <- cbind(train_subject, train_X, train_y, type)


# read testing data 
test_subject <- read.table("./test/subject_test.txt", sep="")
test_X <- read.csv("./test/X_test.txt", header=FALSE, sep="")
test_y <- read.table("./test/y_test.txt", sep="")
type <- rep("test", dim(test_subject)[1])
testData <- cbind(test_subject, test_X, test_y, type)

# combine test and training in one dataframe 
data <- rbind(trainData, testData)


# TASK 2 Uses descriptive activity names to name the activities in the data set
# TASK 4 Appropriately labels the data set with descriptive variable names. 

# read features and give the names to the dataframe 
names(data)[1] <- paste("SubjectID")
names(data)[563] <- paste("ActivityID")
featuresname <- read.table("features.txt", header=FALSE, sep="")
features <- featuresname[2]
names(data)[2:562] <- paste(t(features))
meanValue <- grepl("mean", names(data))
stdValue <- grepl("std", names(data))
extractionPoint <- meanValue + stdValue
extractionPoint <- as.logical(extractionPoint)
extractionPoint[1] <- TRUE
extractionPoint[563] <- TRUE
extractionPoint[564] <- TRUE
filteredData <- data[, extractionPoint]


# TASK 3 Uses descriptive activity names to name the activities in the data set
labels <- read.table("activity_labels.txt")
#activityLabels <- labels[2]
# class(filteredData$ActivityID)
#names(labels)[2] <- "ActivityID"
cleanData <- merge(filteredData, labels, by.x = c("ActivityID"), by.y = c("V1"))
#filteredData$ActivityID <- factor(filteredData$ActivityID, labels = activityLabels)

cleanData$ActivityID <- NULL

# TASK 5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject
library(reshape)
library(reshape2)

meltData <- melt(cleanData, id=c("SubjectID","V2"), measure.vars = c(""))
meltData$value <- as.numeric(meltData$value)

tidyData <- dcast(meltData, SubjectID + V2 ~ variable, mean)
tidyData$type <- NULL

write.csv(tidyData, file = "tidyData.csv")
