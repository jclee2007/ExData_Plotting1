##  Create Plot#4.  Project #1 for Exploratory Data Analysis

## Set working directory and read in data table
setwd("C:/Users/jlee/Documents/Data Science/Exploratory Data Analysis/")
powerConsumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

## Convert Date to proper format.  Subset data set to only get Feb 1 & 2, 2007
powerConsumption$Date <- as.Date(powerConsumption$Date, "%d/%m/%Y")
powerc <- powerConsumption[powerConsumption$Date == "2007-02-01" | powerConsumption$Date == "2007-02-02",]

## Convert other metrics to numeric
powerc$Global_active_power <- as.numeric(powerc$Global_active_power)

##  Open png device 
png(file="Plot1.png", width=480, height=480)

##  Create Plot #1
hist(powerc$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

#  Turn off png device
dev.off()