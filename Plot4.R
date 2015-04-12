##  Create Plot#4.  Project #1 for Exploratory Data Analysis

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
powerc$Voltage <- as.numeric(powerc$Voltage)
powerc$Global_reactive_power <- as.numeric(powerc$Global_reactive_power)

## Create DateTime variable to be used as x-axis in plots 
tline <- paste(powerc$Date,powerc$Time)
tline <- strptime(tline,"%Y-%m-%d %H:%M:%S")

# Set parameters for Plot #4
par(mfcol = c(2,2), mar = c(5,4,2,2))

# Create the first plot in row 1, column 1
plot(tline,powerc$Global_active_power, type="l", xlab= "", ylab = "Global Active Power")

# Create the second plot in row 2, column 1
plot(tline,powerc$Sub_metering_1,type="n", ylab = "Energy sub metering", xlab = "")
points(tline,powerc$Sub_metering_1, type = "l", col = "black")
points(tline,powerc$Sub_metering_2, type = "l", col = "red")
points(tline,powerc$Sub_metering_3, type = "l", col = "blue")
legend(x=strptime("2007-02-02 23:00:00","%Y-%m-%d %H:%M:%S"),y=45, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=1, col = c("black","red","blue"), bty = "n", y.intersp =.2, x.intersp =.2, xjust = 1, cex =.7)

# Create the third plot in row 1, column 2
plot(tline,powerc$Voltage, type="l", xlab= "datetime", ylab = "Voltage")

# Create the third plot in row 2, column 2
plot(tline,powerc$Global_reactive_power, type="l", ylab = "Global_reactive_power",xlab= "datetime")

# Copy to png file 
dev.copy(png,file="Plot4.png")
dev.off()