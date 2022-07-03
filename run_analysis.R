
# Before I start doing assignment-- I need 2 install required packages --
install.packages("dplyr");library(dplyr)

# Now I am getting data -- that is download and load it in R memory --
zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Here I am 2 assign a name 2 the file 2 be downloaded 
zipFile <- "UCI HAR Dataset.zip"

# Check 2 see if directory exists-- if not I am gonna create one --
if(!file.exists("./data")){dir.create("./data")}

# The I download the file into file name under ./data directory
download.file(zipUrl,destfile = "./data/UCI HAR Dataset.zip",method = "curl",mode = "wb")

# Now 2 unzip the file into same directory where <zipFile> is contained --
unzip(zipFile,exdir = "./data")

# Now reading the data files and tables --

trainingSubjects<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")
trainingValues<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
trainingActivity<-read.table("./data/UCI HAR Dataset/train/y_train.txt")

# Now I am reading the data for test directory --

testSubjects<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")
testValues<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
testActivity<-read.table("./data/UCI HAR Dataset/test/y_test.txt")

# Now reading activity labels into R memory --

activities<-read.table("./data/UCI HAR Dataset/activity_labels.txt")
colnames(activities)<-c("activityId","activityLabel")

# Now reading features table into memory --

features<-read.table("./data/UCI HAR Dataset/features.txt")

# Now I need 2 merge training and the test sets to create one data set

mrg_train<-cbind(trainingSubjects,trainingValues,trainingActivity)
mrg_test<-cbind(testSubjects,testValues,testActivity)
humanActivity<-rbind(mrg_train,mrg_test)

# Using cbind()command it puts together vector and/or matrix and/or data frames --
# Using rbind() command I put 2 tables on top of each other so 2 speak --

# Since new table does not have column/variable names I need 2 assign them a value --

colnames(humanActivity)<-c("subject",features[,2],"activity")

# Now, 2 get the measurements on the mean and standard deviation --
# Here I am getting chr vectors that contain name only four shown below --

columnsToKeep <- grepl("subject|activity|mean|std", colnames(humanActivity))
humanActivity<-humanActivity[,columnsToKeep]

# Here I need 2 use descriptive activity names to name the activities in the data set--
humanActivity$activity<-factor(humanActivity$activity,levels = activities[,1],labels = activities[,2])

# Now,I need  label the data set with descriptive variable/columns names --
# That way merged table is much more understandable for users --

----------------------------------------------------------------------------------

# Here I am grouping <humanActivity> table by 2 subject and activity columns --
# Then using summarise_each() command taking mean of all columns --

humanActivityMeans<-summarise_each( group_by(humanActivity,subject,activity),mean)

# Lastly, I need to write the file up into <tidy_data.txt> file before submission --
write.table(humanActivityMeans,tidy_data.txt,row.names = FALSE,quote = FALSE)







