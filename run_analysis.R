## This is the course project for the 'Getting and Cleaning data course'
## This R program takes the raw data set and produces a tidy data set as per instructions

library(data.table)
library(plyr)

setwd("/Users/kalaivanirameakubendran/Documents/Courses/Coursera/getandcleandata/UCI HAR Dataset")
directory_path <- "/Users/kalaivanirameakubendran/Documents/Courses/Coursera/getandcleandata/UCI HAR Dataset"

## This function is used to read the data files
fileread <- function(foldername, filename, dir){
  
  fil_name <- paste(dir, "/", foldername, "/", filename, "_", foldername, ".txt", sep="")
  
  p <- read.table(fil_name, header=FALSE)
  
  p
  
}

## Six files are read into the program, three from 'test' and three from 'train' categories
## The types of files read are: subject, y (this is the activity file), and X file that has the measurements


## Subject IDs are read first
subject_test <- fileread("test", "subject", directory_path)
subject_train <- fileread("train", "subject", directory_path)

## Measurements are read here
X_test <- fileread("test", "X", directory_path)
X_train <- fileread("train", "X", directory_path)

## features.txt file is read, which will be used to extract the mean and SD from the measurement dataframe
features <- read.table("features.txt", header=FALSE)

## The factor class is changed to character, as it will be useful to identify pattern of strings
features[,2] <- as.character(features[,2])

## The grep function is used to see which columns have 'mean()' and 'std()' strings in them
## It has to be noted that the columns that have meanFreq() will be ignored for this data extraction
mean_vector <- grep("mean()", features[,2], fixed=TRUE)
std_vector <- grep("std()", features[,2], fixed=TRUE)

## These vectors will then be used to extract the mean and std columns from the measurement dataset
extracted_mean_test <- X_test[, mean_vector]
extracted_std_test <- X_test[, std_vector]

extracted_mean_train <- X_train[, mean_vector]
extracted_std_train <- X_train[, std_vector]

## The activity IDs are read into the program next
y_test <- fileread("test", "y", directory_path)
y_train <- fileread("train", "y", directory_path)

## They are assigned their equivalent label data 
y_test_labeled <- factor(y_test[,1], levels=c(1,2,3,4,5,6), labels=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
y_train_labeled <- factor(y_train[,1], levels=c(1,2,3,4,5,6), labels=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

## Data frames are created for test as well as train data
## based on subject, activity and the mean and std measurements
test_df <- data.frame(subject_test, y_test_labeled, extracted_mean_test, extracted_std_test)
train_df <- data.frame(subject_train, y_train_labeled, extracted_mean_train, extracted_std_train)

## The column names are given first from their raw dataset
temp_col_names <- c("Subject", "Activity", features[mean_vector,2], features[std_vector,2])

## They are then modified to make it more meaningful
final_col_names <- sub("tB", "Time-B", temp_col_names)
final_col_names <- sub("tG", "Time-G", final_col_names)
final_col_names <- sub("BodyBody", "Body", final_col_names)
final_col_names <- sub("fB", "Freq-B", final_col_names)
final_col_names <- sub("fB", "Freq-B", final_col_names)
final_col_names <- gsub("()", "", final_col_names, fixed=TRUE)
final_col_names <- gsub("std", "SD", final_col_names, fixed=TRUE)
final_col_names <- gsub("mean", "Mean", final_col_names, fixed=TRUE)

## These names are then assigned to 'test' and 'train' data frames
## As it will be used to merge them easily
colnames(test_df) <- final_col_names
colnames(train_df) <- final_col_names

## Both these data are merged using 'rbind' command
samsung_df <- rbind(test_df, train_df)

## The merged dataframe is arranged per each subject and each activity 
samsung_df <- arrange(samsung_df, samsung_df$Subject, samsung_df$Activity)

## the next step is to calculate the average data for each person and each activity
## For this, we need to get the mean of the columns by two groups: subject and activity
## the dataframe is converted into data.table for easy operation
samsung_dt <- data.table(samsung_df)
samsung <- samsung_dt[,lapply(.SD,mean), by="Subject,Activity"]

##The final table is then written into a text file
write.table(samsung, "samsung.txt", col.names=TRUE, sep="\t")




