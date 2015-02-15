
## Study design
Three columns were added to each of the training and the test sets: “Subject”, “Activity” and “Set”. “Subject” was the name given to the columns resultant from the subject_test and subject_train files. “Activity” was the name given to the columns resultant from the y_test and y_train files. “Set” was the name given to the columns created to identify the set. 
Then the two data sets were joined by using the rbind function. The features file was used to label the rest of the columns. In order to extratct only the measurements on the mean and standard deviation for each measurement, it was necessary to make the columns names unique. Afterwards, it was made the replacement of the activities numbers with descriptive terms. The columns headers that were composed by “BodyBody” were edited and this part was turned into “Body”. 
Finally, the data was grouped by set, by activity and by subject so that the average of each measurement were calculated. With the aim of getting the long form of the data, the columns related to the measurements were gathered into one and a column called “Average” was created to store the mean of each combination.

## Code book

### Set
Variable that identifies to which data set belongs the values of the other columns. 
* test
* train

### Subject
Variable that identifies the subject who carried out the experiment. Its range is from 1 to 30.

### Activity 
Variable that identifies the activity performed by the subjects. Each person performed six activities. 
* LAYING
* SITTING
* STANDING
* WALKING
* WALKING_DOWNSTAIRS
* WALKING_UPSTAIRS

### Measurement
Variable that identifies the signals measures estimated (mean value and standard deviation). 
The signals correspond to:
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag



* prefix 't' to denote time domain signals
* prefix  'f' to indicate frequency domain signals
* accelerometer and gyroscope 3-axial raw signals: tAcc-XYZ and tGyro-XYZ
* acceleration signal separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
* body linear acceleration and angular velocity derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ)
* magnitude of these three-dimensional signals calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag)
* '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions

### Average
Average of each measurement for each activity, each subject and each set.
