library(plyr)

## Read Data Components into R
Data1 <-read.table("x_test.txt")  ## Read Test Set into R as Table Data1
Data1a <- read.table("subject_test.txt") ## Read Test Subjects into R as Table Data1a
Data1b <- read.table("y_test.txt") ## Read Test Activity Codes into R as Table Data1b

Data2 <- read.table("x_train.txt") ## Read Training Set into R as Table Data2
Data2a <- read.table("subject_train.txt") ## Read Training Subjects into R Table Data2a
Data2b <- read.table("y_train.txt") ## Read Training Activity Codes into R as Table Data2b

Data3 <- read.table("features.txt") ## Read Measurement Column Names into R as Table Data3

## Assign Original Variable Names to each Data Set
colnames(Data1) <- Data3$V2  ## Assign variable names from features.txt
colnames(Data1a) <- "Subject"
colnames(Data1b) <- "Activity"
colnames(Data2) <- Data3$V2    ## Assign variable names from features.txt
colnames(Data2a) <- "Subject"
colnames(Data2b) <- "Activity"

## Combine Subject and Activity Variables with Test and Training datasets
Data1_all <- cbind(Data1a,Data1b,Data1) 
Data2_all <- cbind(Data2a,Data2b,Data2) 

## Combine (Merge) Test and Training datasets
Combined_data <- rbind(Data1_all,Data2_all) 


## Extract Subject, Activity, and Measurements for Means and Std Dev
extract_data <- Combined_data[,c(1:8,43:48,83:88,123:128,
                                 163:168,203,204,216,217,229,230,242,243,
                                 255,256,268,269,270:273,347:352,426:431,
                                 505,506,518,519,531,532,544,545)] 

## Assign Descriptive Activity Names to Each Activity
extract_data$Activity[which(extract_data$Activity == 1)] <- "Walking"
extract_data$Activity[which(extract_data$Activity == 2)] <- "Walking Upstairs"
extract_data$Activity[which(extract_data$Activity == 3)] <- "Walking Downstairs"
extract_data$Activity[which(extract_data$Activity == 4)] <- "Sitting"
extract_data$Activity[which(extract_data$Activity == 5)] <- "Standing"
extract_data$Activity[which(extract_data$Activity == 6)] <- "Laying"

## Label extract_data Variables with Descriptive Variable Names

names(extract_data) <- gsub("Mag","Magnitude",names(extract_data))
names(extract_data) <- gsub("Acc","Accelerometer",names(extract_data))
names(extract_data) <- gsub("Gyro","Gyroscope",names(extract_data))
names(extract_data) <- gsub("-mean\\()-X","MeanX",names(extract_data))
names(extract_data) <- gsub("-mean\\()-Y","MeanY",names(extract_data))
names(extract_data) <- gsub("-mean\\()-Z","MeanZ",names(extract_data))
names(extract_data) <- gsub("-std\\()-X","StandardDeviationX",names(extract_data))
names(extract_data) <- gsub("-std\\()-Y","StandardDeviationY",names(extract_data))
names(extract_data) <- gsub("-std\\()-Z","StandardDeviationZ",names(extract_data))
names(extract_data) <- gsub("-mean\\()","Mean",names(extract_data))
names(extract_data) <- gsub("-std\\()","StandardDeviation",names(extract_data))
names(extract_data) <- gsub("^f","Frequency",names(extract_data))
names(extract_data) <- gsub("^t","Time",names(extract_data))
names(extract_data) <- gsub("BodyBody","Body",names(extract_data))

## Create final, tidy dataset (tidy_data) containing average measurements for
## each subject/activity combination, reassign Subject and Activity variable
## names, and arrange data by Subject / Activity

tidy_data <- aggregate(extract_data[,3:68],
                       by = list(extract_data$Subject, extract_data$Activity),
                       FUN = "mean")
names(tidy_data) <- sub("Group\\.1","Subject",names(tidy_data))
names(tidy_data) <- sub("Group\\.2","Activity",names(tidy_data))

tidy_data <- arrange(tidy_data,tidy_data$Subject,tidy_data$Activity)