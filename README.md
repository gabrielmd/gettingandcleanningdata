Read me - information about this repository
=======================

Repository for the Project Course for Getting and Cleanning Data on Coursera.

This script summarizes the data collected from accelerometers from the Samsung Galaxy S smartphone. 
The original data can be downloaded here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

To create the tidy dataset, run this script in the folder where the Samsung data was extracted. It will perform the following steps:

* Step 1: Firstly, the script sets a variable with the name of the folder with the data and reads the datasets in the folders "train" and "test". After reading and filling the variables, it merges both data frames using the "rbind" function.
* Step 2: The file "features.txt" has the information about the variable names, i.e., the description of each column in the data frame created above. After reading its contents, the script sets the names of the columns using the function "names".
* Step 3: According to the file "features_info.txt", all variables have a suffix to identify which estimation has been done based on the measurements.In the list of suffixes, there are two which were used in this script: "mean()" and "std()".
They represent the average and the standard deviations, respectively.
The script removes all the columns based on their names: only those that end with "mean()" and "std()" are left.
* Step 4: In the next step, the script reads the information about the activities represented by each row. In order to have a more descritive information, the labels are loaded from another text file and added to the data frame.
The information about the subjects that realized the experiments is read from the files and their ids are added to the data frame.
* Step 5: In the final data set, the average of the means and standard deviations is calculated. Each line represents a distinct combination of activity by subject.

The variable "avg.per.activity.subject" will be set with it.
