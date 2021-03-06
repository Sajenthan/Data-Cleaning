
## Code Book


This code book will describe how data is used in this project, as well as the processing required to create the resulting tidy data set in step process.


## Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## Data Source

Data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## files:

- 'features.txt': List of all features.(column label for the Train/Test set)

- 'activity_labels.txt': labels with their activity name.

#### inside Train/Test folder

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training activity for each "Training set" row.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. 
    Its range is from 1 to 30. 


- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test activity for each "Test set"" row.

- 'test/subject_testn.txt': Each row identifies the subject who performed the activity for each window sample. 
    Its range is from 1 to 30. 

## run_analysis.R implementation:

### Manual step
Data downloaded, unziped and prepared for Data extraction and analysis

### Auto step
1. Read the Data 
2. Using rbind: merges the training and the test sets to create one data set.
3. Using grep: extracts only the measurements on the mean and standard deviation for each measurement
4. Using FindReplace: to update activity names to name the activities in the data set
5. Using cbind: Appropriately labels the data set with descriptive variable names.
6. Using melt, dcast: to process the data From the data set in step 6, creates a second, independent tidy data set with the average of each variable for each activity and each subject, write into the file.


