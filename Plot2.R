###############################
## Coursera - Exploratory Data Analysis
## Course Project 1 - Plot 2
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

#Subset the DataSet to work with the dates required
subSetDS <- DS[DS$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert the date to a format for plotting
datetime <- strptime(paste(subSetDS$Date, subSetDS$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Cast values to numeric
ActivePowerDS <- as.numeric(subSetDS$Global_active_power)

#Plot Data
png("plot2.png", width=480, height=480)
plot(datetime, ActivePowerDS, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()