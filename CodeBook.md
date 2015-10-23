
# Files Referred from which the data was downloaded

Train Set : X_train, y_train, subject_train; 
Test Set : X_test, y_test, subject_test; 
features.txt; 
activity_labels.txt

# Merging the two data sets

Data set were first individually merged i.e. x with x, y with y and subject with subject to obtain : 
x_dataset; y_dataset; subject_dataset

# Referring to the features.txt

The mean and standard deviation columns were obtained and accordingly x_dataset was labeled using these names.

# Referring the activity_labels.txt

The activity labels were added to the y_dataset

The subject column name was added to the subject_dataset.

# Final merged data set

The x_dataset, y_dataset and subject_dataset were then binded to create one_dataset.

# Creating dataset_with_average.txt

The average for each variable for activity and each subject were then calculated using the one_dataset to obtain tidy data.





