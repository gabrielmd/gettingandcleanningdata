## Code book

### Data

The data used in this script represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### Procedure

The script called run_analysis.R that does the following:

 * Merges the training and the test sets to create one data set. 
 * Extracts only the measurements on the mean and standard deviation for each measurement. 
 * Uses descriptive activity names to name the activities in the data set
 * Appropriately labels the data set with descriptive variable names. 
 * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Each following step in this procedure does not necessarily correspond to the tasks described above.

* Step 1: Firstly, the script sets a variable with the name of the folder with the data and reads the datasets in the folders "train" and "test". After reading and filling the variables, it merges both data frames using the "rbind" function.
* Step 2: The file "features.txt" has the information about the variable names, i.e., the description of each column in the data frame created above. After reading its contents, the script sets the names of the columns using the function "names".
* Step 3: According to the file "features_info.txt", all variables have a suffix to identify which estimation has been done based on the measurements.In the list of suffixes, there are two which were used in this script: "mean()" and "std()".
They represent the average and the standard deviations, respectively.
The script removes all the columns based on their names: only those that end with "mean()" and "std()" are left.
* Step 4: In the next step, the script reads the information about the activities represented by each row. In order to have a more descritive information, the labels are loaded from another text file and added to the data frame.
The information about the subjects that realized the experiments is read from the files and their ids are added to the data frame.
* Step 5: In the final data set, the average of the means and standard deviations is calculated. Each line represents a distinct combination of activity by subject.

### Variables in the Tidy Dataset

* Time domain signals
	* Using the accelerator
		* Body Movement
			* Averages
				* **tBodyAcc-mean()-X**: numeric value, representing the X direction
				* **tBodyAcc-mean()-Y**: numeric value, representing the Y direction
				* **tBodyAcc-mean()-Z**: numeric value, representing the Z direction
			* Averages of the standard deviations
				* **tBodyAcc-std()-X**: numeric value, representing the X direction
				* **tBodyAcc-std()-Y**: numeric value, representing the Y direction
				* **tBodyAcc-std()-Z**: numeric value, representing the Z direction
		* Gravity
			* Averages
				* **tGravityAcc-mean()-X**: numeric value, representing the X direction
				* **tGravityAcc-mean()-Y**: numeric value, representing the Y direction
				* **tGravityAcc-mean()-Z**: numeric value, representing the Z direction
			* Averages of the standard deviations
				* **tGravityAcc-std()-X**: numeric value, representing the X direction
				* **tGravityAcc-std()-Y**: numeric value, representing the Y direction
				* **tGravityAcc-std()-Z**: numeric value, representing the Z direction
		* Jerk signals
			* Averages
				* **tBodyAccJerk-mean()-X**: numeric value, representing the X direction
				* **tBodyAccJerk-mean()-Y**: numeric value, representing the Y direction
				* **tBodyAccJerk-mean()-Z**: numeric value, representing the Z direction
			* Averages of the standard deviations
				* **tBodyAccJerk-std()-X**: numeric value, representing the X direction
				* **tBodyAccJerk-std()-Y**: numeric value, representing the X direction
				* **tBodyAccJerk-std()-Z**: numeric value, representing the X direction
	* Using the gyroscope
		* Body Movement
			* Averages
				* **tBodyGyro-mean()-X**: numeric value, representing the X direction
				* **tBodyGyro-mean()-Y**: numeric value, representing the Y direction
				* **tBodyGyro-mean()-Z**: numeric value, representing the Z direction
			* Averages of the standard deviations
				* **tBodyGyro-std()-X**: numeric value, representing the X direction
				* **tBodyGyro-std()-Y**: numeric value, representing the Y direction
				* **tBodyGyro-std()-Z**: numeric value, representing the Z direction
		* Jerk signals
			* Averages
				* **tBodyGyroJerk-mean()-X**: numeric value, representing the X direction
				* **tBodyGyroJerk-mean()-Y**: numeric value, representing the Y direction
				* **tBodyGyroJerk-mean()-Z**: numeric value, representing the Z direction
			* Averages of the standard deviations
				* **tBodyGyroJerk-std()-X**: numeric value, representing the X direction
				* **tBodyGyroJerk-std()-Y**: numeric value, representing the Y direction
				* **tBodyGyroJerk-std()-Z**: numeric value, representing the Z direction
	* Magnitude of the values
		* Using the accelerator
			* Body movement
				* **tBodyAccMag-mean()**: numeric value, representing the average
				* **tBodyAccMag-std()**: numeric value, representing the average of the standard deviations
			* Gravity
				* **tGravityAccMag-mean()**: numeric value, representing the average
				* **tGravityAccMag-std()**: numeric value, representing the average of the standard deviations
			* Jerk signal
				* **tBodyAccJerkMag-mean()**: numeric value, representing the average
				* **tBodyAccJerkMag-std()**: numeric value, representing the average of the standard deviations
		* Using the gyroscope
			* Body movement
				* **tBodyGyroMag-mean()**: numeric value, representing the average
				* **tBodyGyroMag-std()**: numeric value, representing the average of the standard deviations
			* Jerk signal
				* **tBodyGyroJerkMag-mean()**: numeric value, representing the average
				* **tBodyGyroJerkMag-std()**: numeric value, representing the average of the standard deviations
* Frequency domain signals
	* Using the accelerator
		* Body Movement
			* Averages
				* **fBodyAcc-mean()-X**: numeric value, representing the X direction
				* **fBodyAcc-mean()-Y**: numeric value, representing the Y direction
				* **fBodyAcc-mean()-Z**: numeric value, representing the Z direction
			* Averages of the standard deviations
				* **fBodyAcc-std()-X**: numeric value, representing the X direction
				* **fBodyAcc-std()-Y**: numeric value, representing the Y direction
				* **fBodyAcc-std()-Z**: numeric value, representing the Z direction
		* Gravity
			* Averages
				* **fGravityAcc-mean()-X**: numeric value, representing the X direction
				* **fGravityAcc-mean()-Y**: numeric value, representing the Y direction
				* **fGravityAcc-mean()-Z**: numeric value, representing the Z direction
			* Averages of the standard deviations
				* **fGravityAcc-std()-X**: numeric value, representing the X direction
				* **fGravityAcc-std()-Y**: numeric value, representing the Y direction
				* **fGravityAcc-std()-Z**: numeric value, representing the Z direction
		* Jerk signals
			* Averages
				* **fBodyAccJerk-mean()-X**: numeric value, representing the X direction
				* **fBodyAccJerk-mean()-Y**: numeric value, representing the Y direction
				* **fBodyAccJerk-mean()-Z**: numeric value, representing the Z direction
			* Averages of the standard deviations
				* **fBodyAccJerk-std()-X**: numeric value, representing the X direction
				* **fBodyAccJerk-std()-Y**: numeric value, representing the X direction
				* **fBodyAccJerk-std()-Z**: numeric value, representing the X direction
	* Using the gyroscope
		* Body Movement
			* Averages
				* **fBodyGyro-mean()-X**: numeric value, representing the X direction
				* **fBodyGyro-mean()-Y**: numeric value, representing the Y direction
				* **fBodyGyro-mean()-Z**: numeric value, representing the Z direction
			* Averages of the standard deviations
				* **fBodyGyro-std()-X**: numeric value, representing the X direction
				* **fBodyGyro-std()-Y**: numeric value, representing the Y direction
				* **fBodyGyro-std()-Z**: numeric value, representing the Z direction
		* Jerk signals
			* Averages
				* **fBodyGyroJerk-mean()-X**: numeric value, representing the X direction
				* **fBodyGyroJerk-mean()-Y**: numeric value, representing the Y direction
				* **fBodyGyroJerk-mean()-Z**: numeric value, representing the Z direction
			* Averages of the standard deviations
				* **fBodyGyroJerk-std()-X**: numeric value, representing the X direction
				* **fBodyGyroJerk-std()-Y**: numeric value, representing the Y direction
				* **fBodyGyroJerk-std()-Z**: numeric value, representing the Z direction
	* Magnitude of the values
		* Using the accelerator
			* Body movement
				* **fBodyAccMag-mean()**: numeric value, representing the average
				* **fBodyAccMag-std()**: numeric value, representing the average of the standard deviations
			* Gravity
				* **fGravityAccMag-mean()**: numeric value, representing the average
				* **fGravityAccMag-std()**: numeric value, representing the average of the standard deviations
			* Jerk signal
				* **fBodyAccJerkMag-mean()**: numeric value, representing the average
				* **fBodyAccJerkMag-std()**: numeric value, representing the average of the standard deviations
		* Using the gyroscope
			* Body movement
				* **fBodyGyroMag-mean()**: numeric value, representing the average
				* **fBodyGyroMag-std()**: numeric value, representing the average of the standard deviations
			* Jerk signal
				* **fBodyGyroJerkMag-mean()**: numeric value, representing the average
				* **fBodyGyroJerkMag-std()**: numeric value, representing the average of the standard deviations
* Identification
	* **subject**: integer, representing the id of the subject that did the movements
	* **activity**: string, representing which was the activity executed by this subject when these values were captured


