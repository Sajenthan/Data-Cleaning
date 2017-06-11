# Getting and Cleaning Data



## Course project

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Including Code

run_analysis.R included the follows:

### Auto step
1. Read the Data 
2. `Using rbind:`     
        merges the training and the test sets to create one data set.
3. `Using grep:`      
        extracts only the measurements on the mean and standard deviation for each measurement
4. `Using FindReplace:`
        to update activity names to name the activities in the data set
5. `Using cbind:`     
        Appropriately labels the data set with descriptive variable names.
6. `Using melt, dcast:` 
        to process the data From the data set in step 6, creates a second, independent tidy data set with the average of each variable for each activity and each subject,        write into the file `tidy.csv`.

