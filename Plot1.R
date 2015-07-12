###############################
## Coursera - Exploratory Data Analysis
## Course Project 1 - Plot 1
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

#Cast values to numeric
ActivePowerDS <- as.numeric(subSetDS$Global_active_power)

#Plot Data
png("plot1.png", width=480, height=480)
hist(ActivePowerDS, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()