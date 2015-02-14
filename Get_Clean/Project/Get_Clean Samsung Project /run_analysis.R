#Setting working directory to download and unzip the data files
setwd("/home/mrysio/Repos/datasciencecoursera/Get_Clean/Project")

#Download and unzip the data
my_zip_name <-"smartphone_data" 
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = my_zip_name)
unzip(my_zip_name)

#Setting working directory for purpose of this project
setwd("/home/mrysio/Repos/datasciencecoursera/Get_Clean/Project/UCI HAR Dataset/")

#Read data into R and perform basic joins within test data sets and train data sets

#Read test files
subject_test <- read.table("./test/subject_test.txt", header= FALSE)
X_test <- read.table("./test/X_test.txt", header= FALSE)
Y_test <- read.table("./test/y_test.txt", header= FALSE)

#Join test data sets into one
test_data <- cbind(subject_test,Y_test,X_test)

#Read training files
subject_train <- read.table("./train/subject_train.txt", header= FALSE)
X_train <- read.table("./train/X_train.txt", header= FALSE)
Y_train <- read.table("./train/y_train.txt", header= FALSE)

#Join train data sets into one
train_data <- cbind(subject_train,Y_train,X_train)

#Merges the training and the test sets to create one data set.
merged_data <- rbind(test_data,train_data)

#Read features names
features <- read.table("./features.txt", header= FALSE)

#Appropriately labels the data set with descriptive variable names. 
two_first_columns<- c("subject","activity")
features <- as.vector(features[,2])
all_colnames <- c(two_first_columns,features)
colnames(merged_data) <- all_colnames

#Remove columns with duplicated variable names
merged_data <- merged_data[, !duplicated(colnames(merged_data))]

#Extracts only the measurements on the mean and standard deviation for each measurement. 
library(dplyr)
extracted_data <- select(merged_data, c(contains("subject"), contains("activity"),
                                        contains("mean()"), contains("std()")))

#Use descriptive activity names to name the activities in the data set
#Read activity names dictionary
act_names <- read.table("./activity_labels.txt", header= FALSE)
total_data <- transform(extracted_data,activity = factor(activity,
                                                         levels=as.vector(act_names[,1]), 
                                                         labels=as.vector(act_names[,2])))

#From the data set in step before, creates a second, independent tidy data set with the average
#of each variable for each activity and each subject
final_data <- total_data %>% group_by(subject,activity) %>% summarise_each(funs(mean))

## dim(final_data)
## [1] 180  68

#Save final data with write.table in order to upload it to coursera assignment
write.table(final_data,"./my_tidy_data.txt", row.name=FALSE)