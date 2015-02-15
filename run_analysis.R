## System (Windows) 
## Set the working directory as the "UCI HAR Dataset" folder
setwd("...\\UCI HAR Dataset")


## Reading into the train and the test folders
files_full_train <- list.files("train", full.names=TRUE)
files_full_test <- list.files("test", full.names=TRUE)

## Reading files ("train/X_train.txt" and "test/X_test.txt")
data_train_X <- read.table(files_full_train[3])

data_test_X <- read.table(files_full_test[3])

## Reading files ("train/y_train.txt" and "test/y_test.txt") and setting the names
data_train_Y <- read.table(files_full_train[4])

data_test_Y <- read.table(files_full_test[4])

## Reading files (subject) and setting the name 
data_train_subject <- read.table(files_full_train[2])

data_test_subject <- read.table(files_full_test[2])

## Reading features file (columns headers)
data_features <-  read.table("features.txt")

## Reading activity_labels file
data_activity_labels <-  read.table("activity_labels.txt")

## Adding a column called "Set" (Package dplyr version 0.4.1)
data_train_X_set <- mutate(data_train_X, Set="train")
data_test_X_set <- mutate(data_test_X, Set="test")

## Joining the training and the test sets to create one data set
data_train_XY_set <- cbind(data_train_Y, data_train_X_set)

data_train_XY_set_subject <- cbind(data_train_subject, data_train_XY_set)


data_test_XY_set <- cbind(data_test_Y, data_test_X_set)

data_test_XY_set_subject <- cbind(data_test_subject, data_test_XY_set)


all_data <- rbind(data_train_XY_set_subject, data_test_XY_set_subject)



## Adding columns names
colnames(all_data) <- c("Subject","Activity",as.character(data_features[["V2"]]),"Set")

## Making the columns names unique
names(all_data) <- make.names(names(all_data), unique=TRUE)

## Extracting only the measurements on the mean and standard deviation for each measurement (Package dplyr version 0.4.1)
selection_criterion <- c("Subject", "Activity", "mean", "std", "Set")
selected_all_data <- select(all_data, contains("Subject"), contains("Activity"), contains("mean"), contains("std"), contains("Set"), -contains("meanFreq"), -contains("angle"))

## replacing the activities numbers with descriptive terms
selected_all_data$Activity <- data_activity_labels[,2][match(selected_all_data$Activity, data_activity_labels[,1])]

## Editting names with "BodyBody" 
colnames(selected_all_data) <- gsub("BodyBody", "Body", colnames(selected_all_data))

## grouping the data by activity and by subject (Package dplyr version 0.4.1)
data_by_activity_subject <- group_by(selected_all_data, Set, Subject, Activity)

## Average of each variable for each activity and each subject (Package dplyr version 0.4.1 and Package tidyr version 0.2.0)
wide_tidy_data <- summarise_each(data_by_activity_subject, funs(mean), tBodyAcc.mean...X:fBodyGyroJerkMag.std..)
long_tidy_data <- gather(wide_tidy_data, Measurement, Average, tBodyAcc.mean...X:fBodyGyroJerkMag.std..)
long_tidy_data <- as.data.frame(long_tidy_data)





