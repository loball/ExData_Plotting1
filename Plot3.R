###############################
## Coursera - Exploratory Data Analysis
## Course Project 1 - Plot 3
##
## 
## Author: Lorenzo Ball
## Date: 7/10/15
## 
## This script takes data from the Electric Power Consumption
## Data from the UC Irvine Machine Learning Repository Website
###############################

# Read data from file and put in a Data Set
dataFile <- "household_power_consumption.txt"
DS <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetDS <- DS[DS$Date %in% c("1/2/2007","2/2/2007") ,]

# Cast Submetering data to numeric 
datetime <- strptime(paste(subSetDS$Date, subSetDS$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
ActivePowerDS <- as.numeric(subSetDS$Global_active_power)
subMetering1 <- as.numeric(subSetDS$Sub_metering_1)
subMetering2 <- as.numeric(subSetDS$Sub_metering_2)
subMetering3 <- as.numeric(subSetDS$Sub_metering_3)

# Plot Submetering data
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()