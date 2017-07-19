library(reshape2)

# Download and extract the raw data if not already done
if(!file.exists("data.zip"))
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                  destfile = "data.zip", method = "curl")
if(!file.exists("UCI HAR Dataset")) unzip("data.zip")

# Load the data from the given type ("test" or "train")
load <- function(type) {
    rawColNames <- read.table("UCI HAR Dataset/features.txt")[[2]]
    xs <- read.table(paste0("UCI HAR Dataset/", type, "/X_", type, ".txt"),
                     col.names = rawColNames, check.names = FALSE)
    colSelector <- grep("(mean|std)\\(\\)", rawColNames)
    xs <- xs[,colSelector]

    subjects <- read.table(paste0("UCI HAR Dataset/", type, "/subject_", type,
                                  ".txt"),
                           col.names = c("subject"))

    activities <- read.table("UCI HAR Dataset/activity_labels.txt")[[2]]
    ys <- read.table(paste0("UCI HAR Dataset/", type, "/y_", type, ".txt"),
                     col.names = c("activity"))
    ys <- sapply(ys, function(i) activities[i])

    cbind(xs, subjects, ys)
}

# Load all the data
traindata <- load("train")
testdata  <- load("test")
data <- rbind(traindata, testdata)

# Generate the averages
subjects <- unique(data$subject)
activities <- unique(data$activity)
colNames <- names(data)[1:(length(names(data))-2)]

averages <- data.frame()

for(subject in subjects) {
    for(activity in activities) {
        selector <- data$subject == subject & data$activity == activity
        subdata <- data[selector,]

        for(variable in colNames) {
            values <- subdata[[variable]]
            row <- data.frame(subject = subject, activity = activity,
                              variable = variable, average = mean(values))
            averages <- rbind(averages, row)
        }
    }
}

write.table(averages, "tidy.txt")
