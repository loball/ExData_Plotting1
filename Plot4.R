###############################
## Coursera - Exploratory Data Analysis
## Course Project 1 - Plot 4
##
## 
## Author: Lorenzo Ball
## Date: 7/10/15
## 
## This script takes data from the Electric Power Consumption
## Data from the UC Irvine Machine Learning Repository Website
###############################

# Read data in from file and put in a Data Set
dataFile <- "household_power_consumption.txt"
DS <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetDataDS <- DS[DS$Date %in% c("1/2/2007","2/2/2007") ,]

# Subset the data for Active and Reactive Power 
datetime <- strptime(paste(subSetDataDS$Date, subSetDataDS$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
ActivePowerDS <- as.numeric(subSetDataDS$Global_active_power)
ReactivePowerDS <- as.numeric(subSetDataDS$Global_reactive_power)
voltage <- as.numeric(subSetDataDS$Voltage)
subMetering1 <- as.numeric(subSetDataDS$Sub_metering_1)
subMetering2 <- as.numeric(subSetDataDS$Sub_metering_2)
subMetering3 <- as.numeric(subSetDataDS$Sub_metering_3)

# Create a 2x2 frame for charting the power data
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

# Create Active Power Chart
plot(datetime, ActivePowerDS, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Create Voltage Chart
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# Create Submetering  Chart
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# Create Reactive Power Chart
plot(datetime, ReactivePowerDS, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()