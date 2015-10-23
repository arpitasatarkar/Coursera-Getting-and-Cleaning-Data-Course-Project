
library(plyr)

# Step 1 : Merges the training and the test sets to create one data set

# Reading the data from the train set

x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

# Reading the data from the test set

x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

# Creating x data set

X_dataset <- rbind(x_train, x_test)

# Creating y data set

y_dataset <- rbind(y_train, y_test)

# Creating subject data set

subject_dataset <- rbind(subject_train, subject_test)


# Step 2 : Extracts only the measurements on the mean and standard deviation for each measurement

# Reading the data for features

features <- read.table("features.txt")

# Obtaining columns with mean() or std() in their names

features_with_mean_std <- grep("-(mean|std)\\(\\)", features[, 2])

# Obtaining subset of desired columns from x_dataset

x_dataset <- X_dataset[,features_with_mean_std]

# Adding the column names to the x_dataset

names(x_dataset) <- features[features_with_mean_std, 2]


# Step 3 : Uses descriptive activity names to name the activities in the data set

# Reading the data for activities

activities <- read.table("activity_labels.txt")

# Adding the activities to the y_dataset

y_dataset[, 1] <- activities[y_dataset[, 1], 2]

# Adding column name to the y_dataset

names(y_dataset) <- "activity"


# Setp 4 : Appropriately labels the data set with descriptive variable names

# Adding column name to subject_dataset

names(subject_dataset) <- "subject"

# Binding into a single dataset

one_dataset <- cbind(x_dataset, y_dataset, subject_dataset)


# Step 5 :  Independent tidy data set with the average of each variable 
##              for each activity and each subject

# Calculating average

tidy_dataset_with_average <- ddply(one_dataset, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages_data, "tidy_dataset_with_average.txt", row.name=FALSE)

