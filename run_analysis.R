#Load dplyr
library(dplyr)

getwd()

activities <- read.table("activity_labels.txt")[,2]
features <- read.table("features.txt")[,2]

#set working directory to “test” folder
setwd("/Users/cmryankees19/Downloads/UCI HAR Dataset 3/test")

test <- read.table("x_test.txt")
test_activities <- read.table("y_test.txt")
test_subjects <- read.table("subject_test.txt")

#set working directory to “train” folder
setwd("/Users/cmryankees19/Downloads/UCI HAR Dataset 3/train")
train <- read.table("x_train.txt")
train_activities <- read.table("y_train.txt")
train_subjects <- read.table("subject_train.txt")

#select only the values from “features” that are the mean or standard deviation of a variable
mean_std <- grepl("mean|std", features)

#extract columns that are the mean or standard deviation of a variable
train <- train[, mean_std]
test <- test[, mean_std]

#label the mean and standard deviation variables accordingly
names(test) = features[(mean_std == TRUE)]
names(train) = features[(mean_std == TRUE)]

#combine test and train data tables with the applicable subjects and activities
train <- cbind(Subject = train_subjects$V1, Activity = train_activities$V1, train)
test <- cbind(Subject = test_subjects$V1, Activity = test_activities$V1, test)

#create dataset data table that combines train and test data
dataset <- rbind(test, train)

#change value in Activity column so it matches the corresponding activity name
dataset$Activity <- activities[dataset$Activity]

#make the column names clean
names(dataset) = gsub("^t", "time", names(dataset))
names(dataset) = gsub("^f", "frequency", names(dataset))
names(dataset) = gsub("BodyBody", "Body", names(dataset))
names(dataset) = gsub("Acc", "Acceleration", names(dataset))
names(dataset) = gsub("[()]", "", names(dataset))
names(dataset) = gsub("Mag", "Magnitude", names(dataset))

#subset dataset so that we get a table with the means of each subject with each activity
dataset_means <- dataset %>%
   group_by(Subject, Activity) %>%
   summarise_each(funs(mean))
