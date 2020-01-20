# Getting-and-Cleaning-Data
---
title: "README.md"
author: "thangtruongvn"
date: "1/20/2020"
output: html_document
---

The project is to collect the data and prepare a tidy data file for later use. As quoted here is the overview of how the data source collected from the accelerometers from the Samsung Galaxy S smartphone: "The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data."

Below are the steps that the run_analysis.R script going through to create the tidy data:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The submitted files include:
- README.md
- CodeBook.md
- run_analysis.R : collect and manipulate the data to create the latest tidy data set.
- avg_by_activity_subject.txt : the result data set.

So each row in the data set is the average of each variable (measurements of mean or standard deviation) for each activity and each subject.

To run the script "run_analysis.R", unzip the downloaded file "getdata_projectfiles_UCI HAR Dataset.zip" (<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>) to get the folder "UCI HAR Dataset" in the zip file.
Then set the working directory in R Studio to this folder. 
Run the script "run_analysis.R" in this folder to create the data set "avg_by_activity_subject.txt".

The reference is mainly from the data source "getdata_projectfiles_UCI HAR Dataset.zip", <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> and <https://stackoverflow.com/>.

