# After downloading the required files and open zip files, get all working files in the same folder

# Set Working directory
setwd("D:/Data Science Specialization/Getting and Cleaning Data/Project/Work")

# Read the data files into R:
xtest <- read.table("X_test.txt")
xtrain <- read.table("X_train.txt")
ytest <- read.table("Y_test.txt")
ytrain <- read.table("Y_train.txt")
subjectTest <- read.table("subject_test.txt")
subjectTrain <- read.table("subject_train.txt")
features <- read.table("features.txt")
activitiesLabels <- read.table("activity_labels.txt")

# Create Data set by merging the data files
xData <- rbind(xtrain, xtest)
yData <- rbind(ytrain, ytest)
subjectData <- rbind(subjectTrain, subjectTest)
workingData <- cbind(subjectData, yData, xData)

# Name the measurement columns after the feature names, and give names to the id columns
newFeatures <- as.character(features$V2)
newCols <- c("subject", "activity", newFeatures)
colnames(workingData) <- c("subject","activity",newFeatures)

# Creating a new data frame containing only mean and std variables

meansCol <- grep("mean()", colnames(workingData))
STDcol <- grep("std()", colnames(workingData))
revisedColumns <- sort(c(meansCol, STDcol))
newDF <- workingData[, c(1,2,revisedColumns)]
newDF <- newDF[, !grepl("Freq", colnames(newDF))] #get rid of the meanFreq columns

# Trim the rows to the 180 needed to show mean values for each subject-activity pair
tidy <- data.frame()
for (i in 1:30) {
        subj<- subset(newDF,subject==i)
        for (j in 1:6){
                actv<- subset(subj, activity==j)
                myresult<-as.vector(apply(actv,2,mean))
                tidy<-rbind(tidy,myresult) 
        }
        
}

# Renaming and creating final file
colnames(tidy)<-colnames(newDF) #rename the columns again, as the names get lost in the mix above
levels(tidy[,2])<-c('walk','upstairswalk','downstairswalk', 'sit','stand', 'lay')
write.table(tidy, "Samsung.txt", sep = "",row.name=FALSE)
