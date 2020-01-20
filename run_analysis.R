## Set the working directory to the folder that has the extracted 
## files from the unzip of "getdata_projectfiles_UCI HAR Dataset.zip"
setwd("C:/Users/.../UCI HAR Dataset") ## Please change this directory appropriately 
## Import the libraries
library(data.table)
library(dplyr)

## Load the train and test X files into R and bind them into a frame
dttrain <- fread("./train/X_train.txt")
dttest <- fread("./test/X_test.txt")
dt_train_test <- rbind(dttrain, dttest)

## Load the features and filter to get only variable names of mean
## and standard deviation measurements
features <- fread("features.txt")
names(features) <- c("measure_id", "measure_name")
features_mean_std <- features %>% filter(grepl("(mean[^F])|(std)", measure_name)) %>% select(measure_id, measure_name)

## Extract only the measurements on the mean and stadard deviation columns
n = nrow(features_mean_std)
m = nrow(dt_train_test)

dt_mean_std <- tbl_df(matrix(nrow = m, ncol = 0)) ## Create an empty m-row data frame 
for (i in 1:n) {
  col = features_mean_std[i, 1]
  dt_mean_std <- cbind(dt_mean_std, dt_train_test[[col]])
}

## Load the train and test y files into R and bind them into a frame
dttrain_y <- fread("./train/y_train.txt")
dttest_y <- fread("./test/y_test.txt")
dt_train_test_y <- rbind(dttrain_y, dttest_y)

##Uses descriptive activity names to name the activities in dt_train_test_y
activities <- fread("activity_labels.txt")
names(activities) <- c("activity_id", "activity_name")
dt_train_test_y <- inner_join(dt_train_test_y, activities, by = c("V1" = "activity_id"))

## Load and bind the subjects 
subj_train <- fread("./train/subject_train.txt")
subj_test <- fread("./test/subject_test.txt")
subj_train_test <- rbind(subj_train, subj_test)

## Add activity and subject columns to the data set
dt <- cbind(dt_train_test_y$activity_name, dt_mean_std)
dt <- cbind(subj_train_test, dt)

## Appropriately labels the data set with descriptive variable names
names(dt) <- c("subject", "activity", features_mean_std$measure_name)

## creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject.
dt2 <- aggregate(. ~ activity + subject, data = dt, FUN = mean)
dt2
## Write the results to file
write.table(dt2, "avg_by_activity_subject.txt", row.names = FALSE)
