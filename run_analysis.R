library(reshape2)
library(data.table)

## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Load the test data
X_test <-read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <-read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <-read.table("./UCI HAR Dataset/test/subject_test.txt")

##Load the train data
X_train <-read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <-read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <-read.table("./UCI HAR Dataset/train/subject_train.txt")

## Load data column names
features<-read.table("./UCI HAR Dataset/features.txt")[,2]

## Label the columns in test data and train data
names(X_test) = features
names(X_train) = features
names(subject_test) = c("Subject")
names(subject_train) = c("Subject")

## Load activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

## Name the activities in test data and train data
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")

## Binding the test data
test_data <- cbind(subject_test,y_test,X_test)

## Binding the train data
train_data <- cbind(subject_train,y_train,X_train)

## Binding the test and train data together
all_data <- rbind(test_data,train_data)

## Extracts "Subject", "Activity_ID", "Activity_Label" and measurements on the mean and standard deviation.
all_data <- all_data[,c(1,2,3,grep("mean|std", names(all_data))] 

## Apply mean function to the dataset to create a tidy data set with the average of each variable for each activity and subject
ID_labels <- names(all_data)[1:3]
data_labels <- names(all_data)[4:82]
melt_data <- melt(all_data, id = ID_labels, measure.vars = data_labels)
mean_data <- dcast(melt_data, Subject + Activity_Label ~ variable, mean)

write.table(mean_data, file="./mean_data.txt", row.names = FALSE)
