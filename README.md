# Getting_and_Cleaning_Data_Project
This repository is my full work for the final project for the “Getting and Cleaning Data” course by Coursera.

The raw data provided contains the following:
1. A training dataset and a test dataset.  Each contains 561 features obtained by “calculating variables from the time and frequency domain,” which are in the x_train.txt and x_test.txt respectively.  
2. In addition, each contains the activity labels in y_train.txt and y_test.txt and the subjects in subject_train.txt and subject_test.txt.
3. The activity_labels.txt with descriptions for each activity label
4. features.txt contains the descriptions for each of the 561 features in the x_train.txt and x_test.txt datasets

For the analysis, I first combined the test and the train datasets, keeping on the features that were either a mean or a standard deviation.  Then, I replaced the activity column with the corresponding labels.  I renamed the columns in the dataset so that they were clean.  Lastly, I created a subsetted dataset, resulting in the means of each subject with each activity.

The script and tidy dataset can also be found in this repository.

The last item is the Code Book, which details the changes made and the resulting data.
