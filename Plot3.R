##  Create Plot#3.  Project #1 for Exploratory Data Analysis

## Set working directory and read in data table
setwd("C:/Users/jlee/Documents/Data Science/Exploratory Data Analysis/")
powerConsumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

## Convert Date to proper format.  Subset data set to only get Feb 1 & 2, 2007
powerConsumption$Date <- as.Date(powerConsumption$Date, "%d/%m/%Y")
powerc <- powerConsumption[powerConsumption$Date == "2007-02-01" | powerConsumption$Date == "2007-02-02",]

## Convert other metrics to numeric
powerc$Global_active_power <- as.numeric(powerc$Global_active_power)
powerc$Sub_metering_1 <- as.numeric(powerc$Sub_metering_1)
powerc$Sub_metering_2 <- as.numeric(powerc$Sub_metering_2)

## Create DateTime variable to be used as x-axis in plots 
tline <- paste(powerc$Date,powerc$Time)
tline <- strptime(tline,"%Y-%m-%d %H:%M:%S")

##  Open png device 
png(file="Plot3.png", width=480, height=480)

##  Create Plot #3
plot(tline,powerc$Sub_metering_1,type="n", ylab = "Energy sub metering", xlab = "")
points(tline,powerc$Sub_metering_1, type = "l", col = "black")
points(tline,powerc$Sub_metering_2, type = "l", col = "red")
points(tline,powerc$Sub_metering_3, type = "l", col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col = c("black","red","blue"))

#  Turn of png device
dev.off()