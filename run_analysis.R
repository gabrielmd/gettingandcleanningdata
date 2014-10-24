folder.name <- "./UCI HAR Dataset/"

# read the datasets
train.dataset <- read.table(paste(folder.name, "train/X_train.txt", sep= ""))
test.dataset <- read.table(paste(folder.name, "test/X_test.txt", sep= ""))

## 1) Merges the training and the test sets to create one data set.
merged.dataset <- rbind(train.dataset, test.dataset)

## 4) Appropriately labels the data set with descriptive variable names.

# first adding the names to the columns, because they will be used to extract the 
# columns for the task n.2.
features <- read.table(paste(folder.name, "features.txt", sep= ""))
names(merged.dataset) <- features$V2

## 2) Extracts only the measurements on the mean and standard deviation for each measurement.

# select the columns which have either "-std()" or "-mean()" in their names
# (according to the readme file, those are the standard deviations and the averages)
selected.names <- grep("-std\\(\\)|-mean\\(\\)", as.character(features$V2))

# After selecting the names of the columns with the means and stds, 
# extract such values in a new variable.
extracted.dataset <- merged.dataset[, selected.names]

## 3) Uses descriptive activity names to name the activities in the data set

# read and merge the activity information for both datasets
labels.tmp <- read.table(paste(folder.name, "train/y_train.txt", sep= ""))
labels.tmp <- rbind(labels.tmp, read.table(paste(folder.name, "test/y_test.txt", sep= "")))

# read the activity labels
activity.labels <- read.table(paste(folder.name, "activity_labels.txt", sep= ""))

# add the labels to the dataset according to the information read above
extracted.dataset$activity.labels <- activity.labels$V2[pmatch(labels.tmp$V1, as.integer(activity.labels$V1), duplicates.ok = T)]

# read and merge information about the subjects
subjects.tmp <- read.table(paste(folder.name, "train/subject_train.txt", sep= ""))
subjects.tmp <- rbind(subjects.tmp, read.table(paste(folder.name, "test/subject_test.txt", sep= "")))

# add the subject ids to the dataset
extracted.dataset$subject <- subjects.tmp$V1

## 5) From the data set in step 4, creates a second, independent tidy dataset 
##    with the average of each variable for each activity and each subject.

# create a list of factors with the activity labels and the subject ids
# it will be useful to calculate the averages
activities.by.subject <- as.factor(paste(extracted.dataset$activity.labels, extracted.dataset$subject))

# remove the columns with the subject ids and the activity labels when calculating the means
names.to.remove <- c("subject", "activity.labels")

# calculating the means for each activity and each subject
avg.per.activity.subject <- as.data.frame(sapply(extracted.dataset[, !names(extracted.dataset) %in% names.to.remove], tapply, activities.by.subject, mean))

# add information about the subject and the activity in the final data frame
avg.per.activity.subject$subject <- tapply(extracted.dataset$subject, activities.by.subject, function(l) {l[1]})
avg.per.activity.subject$activity <- tapply(extracted.dataset$activity.labels, activities.by.subject, function(l) { as.character(l[1])})

# tidy data
avg.per.activity.subject
