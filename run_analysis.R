library(DataCombine)
library(dplyr)
library(reshape2)

features<- read.table("./data/UCI HAR Dataset/features.txt",header = FALSE,sep = "")
features$V2<-as.character(features$V2)
features[562,]<-c(562,"act")

activity<- read.table("./data/UCI HAR Dataset/activity_labels.txt",header = FALSE,sep = "")
volunteer_test<-read.table("./data/UCI HAR Dataset/test/subject_test.txt",header = FALSE,sep = "")

test_set<-read.table("./data/UCI HAR Dataset/test/X_test.txt",header = FALSE,sep = "")
test_set_activity<-read.table("./data/UCI HAR Dataset/test/Y_test.txt",header = FALSE,sep = "")
test_set<-mutate(test_set,act=as.numeric(test_set_activity$V1))
test_subject<-read.table("./data/UCI HAR Dataset/test/subject_test.txt",header = FALSE,sep = "")

train_set<-read.table("./data/UCI HAR Dataset/train/X_train.txt",header = FALSE,sep = "")
train_set_activity<-read.table("./data/UCI HAR Dataset/train/Y_train.txt",header = FALSE,sep = "")
train_set<-mutate(train_set,act=as.numeric(train_set_activity$V1))
train_subject<-read.table("./data/UCI HAR Dataset/train/subject_train.txt",header = FALSE,sep = "")

# 1. Merges the training and the test sets to create one data set.
Binded_set<-rbind(train_set,test_set)
Binded_subject<-rbind(train_subject,test_subject)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement
mean_fea<-grep("mean",features$V2)
std_fea<-grep("std",features$V2)
mean_std_fea<-c(mean_fea,std_fea)
Filltered_set<-Binded_set[,mean_std_fea]
names(Filltered_set)<-features[mean_std_fea,2]

# 3. Uses descriptive activity names to name the activities in the data set
Binded_set$act<-as.character(Binded_set$act)
Binded_set<-FindReplace(data=Binded_set,Var="act",replaceData = activity,from = "V1",to="V2",exact = FALSE)

# 4. Appropriately labels the data set with descriptive variable names.
names(Binded_subject)<-"subject"
names(Binded_set)<-as.character(features$V2)
Binded_set<-cbind(Binded_set,Binded_subject)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
#    for each activity and each subject.

melted_set<-melt(Binded_set,id=c("subject","act"))
tidy_set<-dcast(melted_set,subject+act~variable,mean)

write.csv(tidy_set, "tidy.csv", row.names=FALSE)

