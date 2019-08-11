# Course 4: Exploratory Data Analysis #
# Course Project #1 #

## 0 - Download and read files
#01 - set up working directory
setwd("./AlexPersonal/DataScience/Assignments/Course4_ExploratoryDataAnalysis/Courseproj1")
#02 - define dataset
datafile <- "./household_power_consumption.txt"
#03 - read dataset
fulldata <- read.table(datafile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
#04 - cut dataset
subsetdata <- fulldata[fulldata$Date %in% c("1/2/2007", "2/2/2007"),]

## 1 - Plot date and time chart
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
plot(datetime, as.numeric(subsetdata$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
