Cleaning the data 
============

The following readme file explains how the run_analysis works. 

# TASK 1 - Merges the training and the test sets to create one data set

1. Set the working directory by using setwd()

2. Read training file and testing file, and save in the train and test variables 

3. Combine training and testing dataframe by using cbind and rbind 


# TASK 4 - Appropriately labels the data set with descriptive variable names. 

4. Change the dataframe names to meaningful names

5. Read file "features.txt", and save in a vector 

6. Replace the names in training and testing dataframe with features names using names(data)[2:562] <- paste(t(features))


# TASK 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 

7. Read the names of dataframe and extract the name with "mean" and "std" 

8. Keep the columns with only "mean" and "std" in it 

9. Run filteredData <- data[, extractionPoint]

# TASK 4 - Uses descriptive activity names to name the activities in the data set

10. Merge the activity name with the dataset dataframe 

11. Run cleanData <- merge(filteredData, labels, by.x = c("ActivityID"), by.y = c("V1"))

# TASK 5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

12. Call reshape2 package to use melt 

13. Rearrange the data according to SubjectID and V2 

14. Use dcast to calculate the mean for each variable




