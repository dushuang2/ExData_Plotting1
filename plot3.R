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

## 1 - Plot Sub_metering chart
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
submetering1 <- as.numeric(subsetdata$Sub_metering_1)
submetering2 <- as.numeric(subsetdata$Sub_metering_2)
submetering3 <- as.numeric(subsetdata$Sub_metering_3)

dev.copy(png, file = "plot3.png", width = 480, height = 480)
plot(datetime, submetering1, type="l", xlab="", ylab="Energy_sub_metering")
lines(datetime, submetering2, col = "red")
lines(datetime, submetering3, col = "blue")
legend("topright", c("submetering1", "submetering2", "submetering3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()