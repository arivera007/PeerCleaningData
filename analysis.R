# Script to maniputale data from 
#Human Activity Recognition Using Smartphones Dataset
#Version 1.0
#Output is a tidy data set with the averages of the measurments that include std and mean only
#This script assumes the data is unzipped and in the local directory.

#Required packages: data.table, reshape2
#require(data.table)
#require(reshape2)


#Loading data from files
x_test<-read.table("./test/X_test.txt", header=FALSE,sep="")
y_test<-read.table("./test/y_test.txt", header=FALSE,sep="")
x_train<-read.table("./train/X_train.txt", header=FALSE,sep="")
y_train<-read.table("./train/y_train.txt", header=FALSE,sep="")
subjectTest_train<-read.table("./train/subject_train.txt", header=FALSE,sep="")
subjectTest_test<-read.table("./test/subject_test.txt", header=FALSE,sep="")
labels<-read.table("./activity_labels.txt", header=FALSE,sep="")
features<-read.table("./features.txt", header=FALSE,sep="")

#adding descriptive labels to the activities(Point 3)
#y_test_merge <- merge(y_test, labels, sort=FALSE)   #My merge did not work, left it to try it later
#y_train_merge <- merge(y_train, labels, sort=FALSE)
myLabelsVector_test <- labels$V2[y_test$V1]
myLabelsVector_train <- labels$V2[y_train$V1]



#Joining Training set
train_set <- cbind(subjectTest_train, as.data.frame(myLabelsVector_train), x_train)
names(train_set)[2]<-"activity"

# Joining the Testing set
test_set <- cbind(subjectTest_test, as.data.frame(myLabelsVector_test), x_test)
names(test_set)[2]<-"activity"


# Joining both sets  (Point 1)
wholeSet <- rbind(train_set, test_set)


# Adding descriptive labels to the feature columns (Point 4)
names(wholeSet)[3:563] <- as.character(features[,2])
names(wholeSet)[1:2] <- c("Subject", "Activity")

# Using Regular Expression to get only the mean and std
#meanVector <- grep(".*(mean|std)\\(\\)$",features[,2])  #This option won't include XYZ variables
meanVector <- grep(".*(mean|std)\\(\\)",features[,2])


## The final Tidy Set  (Point 2 and 5 in one)

# calculates the Average of only the columns that have std and mean of the measurments.

#myDataTable <- data.table(wholeSet)  #Transoform my data.frame to data.table for efficiency.
#tidy_data <- myDataTable[, lapply(.SD, mean), by="Subject,Activity", .SDcols=(meanVector+2)]  # I skip 3 columns which are the Subject, Activity Labels and Code.
filtered_data <- wholeSet[,c(1,2,(meanVector+2))]
myMolten <- melt(filtered_data, id=c("Subject","Activity"))
myDcast <- dcast(myMolten, formula=Subject+Activity~variable, mean)

#Generate Tidy File for submission...tidydata.csv (converted to .pdf from an SpreadSheet)
write.table(myDcast, file="./tidydata.csv", sep=",", row.names=FALSE)

