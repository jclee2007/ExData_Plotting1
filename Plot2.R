##  Create Plot#3.  Project #1 for Exploratory Data Analysis

## Set working directory and read in data table
setwd("C:/Users/jlee/Documents/Data Science/Exploratory Data Analysis/")

## Convert Date to proper format.  Subset data set to only get Feb 1 & 2, 2007
powerConsumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
powerConsumption$Date <- as.Date(powerConsumption$Date, "%d/%m/%Y")
powerc <- powerConsumption[powerConsumption$Date == "2007-02-01" | powerConsumption$Date == "2007-02-02",]

## Convert other metrics to numeric
powerc$Global_active_power <- as.numeric(powerc$Global_active_power)

## Create DateTime variable to be used as x-axis in plots 
tline <- paste(powerc$Date,powerc$Time)
tline <- strptime(tline,"%Y-%m-%d %H:%M:%S")

##  Open png device 
png(file="Plot2.png", width=480, height=480)

##  Create Plot #2
plot(tline,powerc$Global_active_power, type="l", xlab= "", ylab = "Global Active Power (kilowatts)")

#  Turn off png device
dev.off()