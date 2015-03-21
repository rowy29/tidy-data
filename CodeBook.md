#CodeBook for run_analysis.R
This file describes the transformations performed on the raw dataset and the variables in the resulting table that is produced 
from the run_analysis.R script

#Transformations 
1. Load the test and train data 
2. Label the columns in both data sets
3. Label the activities in both data sets
4. Merging both data sets together
5. Extract only the measurements on the mean and standard deviation, subject number, activity number and activity labels
6. Apply mean function to the dataset to find average of the measurements for each subject and activity
7. Write the resulting dataset into a .txt file

# mean_data.txt file
The mean_data.txt file in the working directory can be opened in R with the following command:
read.table("./mean_data.txt", header=TRUE)

The table has 180 observations for 81 variables
| column                       | description                                              | type    |
| ---------------------------- | -------------------------------------------------------- | ------- |
| Subject                      | Identifier of the subject                                | integer |
| Activity_ID                  | Identifier of the activity                               | integer |
| Activity_Label               | Label of the Activity_ID                                 | factor  |
| Various mean/std measurements| Average value for per subject per activity               | numeric |


