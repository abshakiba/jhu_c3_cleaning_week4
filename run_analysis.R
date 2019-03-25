# Data Science Specialization - JHU
# #3: Getting and Cleaning Data
# Programming Assignment - Week 4
# Abbas Shakiba

library(dplyr)


# Part 1:
# Merges the training and the test sets to create one data set.
x_train <- read.table("train/X_train.txt", header = FALSE, sep="")
y_train <- read.table("train/y_train.txt", header = FALSE, sep="")
s_train <- read.table("train/subject_train.txt", header = FALSE, sep="")

x_test <- read.table("test/X_test.txt", header = FALSE, sep="")
y_test <- read.table("test/y_test.txt", header = FALSE, sep="")
s_test <- read.table("test/subject_test.txt", header = FALSE, sep="")

features <- read.table("features.txt", header = FALSE, sep="")

data <- rbind(x_train, x_test)
target <- rbind(y_train, y_test)
subject <- rbind (s_train, s_test)

dataset <-  cbind(subject,data,target)

headers <- c("subject",t(features[2]),"Target")

df <- as.data.frame(dataset)
names(df) <- headers


# Part 2:
# Extracts only the measurements on the mean and standard deviation for each measurement.
df_tmp <-  df[grep("mean|Mean|Std|std",names(df))]
df_p2 <-  cbind(subject,df_tmp,target)
names(df_p2) <- c("subject",names(df_tmp),"Target")


# Part 3:
# Uses descriptive activity names to name the activities in the data set
names(df_p2)<-gsub("^t", "time", names(df_p2))
names(df_p2)<-gsub("^f", "frequency", names(df_p2))
names(df_p2)<-gsub("Acc", "Accelerometer", names(df_p2))
names(df_p2)<-gsub("Gyro", "Gyroscope", names(df_p2))
names(df_p2)<-gsub("Mag", "Magnitude", names(df_p2))
names(df_p2)<-gsub("BodyBody", "Body", names(df_p2))
names(df_p2)<-gsub("-mean()-", "Mean", names(df_p2))
names(df_p2)<-gsub("-std()-", "STD", names(df_p2))
names(df_p2)<-gsub("-freq()-", "Frequency", names(df_p2))
df_p3 <- df_p2


# Part 4:
# Appropriately labels the data set with descriptive variable names.
activities <- read.table("activity_labels.txt", header = FALSE, sep="")
names(activities) <- c("Code", "ActivityLabel")
df_p4 <- left_join(df_p3,activities,by=c("Target"="Code"))
df_p4$Target <- NULL 

# Part 5:
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
df_p5 <-aggregate(. ~subject + ActivityLabel, df_p4, mean)
tidy <- df_p5
str(tidy)
