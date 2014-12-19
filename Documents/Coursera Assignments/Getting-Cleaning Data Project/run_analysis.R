# 1: read and bind the tables
#read the train tables
trainData <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
trainLabel <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
#read test tables
testData <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
testLabel <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
#bind Train and test: data, subject andd Label
joinAllData <- rbind(trainData, testData)
joinAllLabel <- rbind(trainLabel, testLabel)
joinAllSubject <- rbind(trainSubject, testSubject)

# 2
#read table
featuresTable <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
#Extract
meanAndStandard <- grep("mean\\(\\)|std\\(\\)", featuresTable[, 2])
#join extract to table
names(joinAllData) <- gsub("\\(\\)", "", featuresTable[meanAndStandard, 2])

# 3
activityLabel <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
activityLabel <- activityLabel[joinAllLabel[, 1], 2]
joinAllData[, 1] <- activityLabel

# 4. Labels the data set with descriptive activity and recombine into Data set
names(joinAllLabel) <- "activities Undertaken"
names(joinAllSubject) <- "all subject"
boundData <- cbind(joinAllData, joinAllLabel, joinAllSubject)

# 5. Writing out data only
write.table(boundData, "./data/merged_data.txt") # write out the dataset

