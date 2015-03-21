# Getting and Cleaning Data
## Course Project for Data Science Coursera

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Introduction

This repository contains work in relation to the above-mentioned Course Project for Data Science Coursera

## About the data
The raw data can be sourced from the following URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

Information about the dataset can be found in the README.txt file included with the dataset

## About the script
The run_analysis.R script will merge the training and test datasets into a single dataset. After which, only the measurements on the mean and standard deviation for each measurement are extracted. 

Lastly, the script will generate a tidy data set with the means of each of the extracted measurements per activity per subject. This tidy data set will be written to a mean_data.txt file, which can be found in the working directory

The following are required to be done before running the script:
1. The raw data must be downloaded and extracted into "UCI RAR Dataset" folder in the working directory
2. "reshape2" and "data.table" package to be installed
