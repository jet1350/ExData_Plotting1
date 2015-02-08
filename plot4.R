## making Plot 4
##
## load necessary modules
library(datasets)

## save and change the current dir
olddir <- getwd()
## go to the course project dir
setwd("C:/Temp/DataScience/EDA-proj1")

## load the data
alldata <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
## subsetting the alldata to the specific scope
sdata <- subset(alldata,Date=="1/2/2007" | Date=="2/2/2007",names(alldata))
## add new data/time column
sdata$Datetime <- strptime(paste(sdata$Date,sdata$Time),"%d/%m/%Y %H:%M:%S")
## change the type of Global_active_power and Global_reactive_power to num
sdata$Global_active_power <- as.numeric(as.character(sdata$Global_active_power))
sdata$Global_reactive_power <- as.numeric(as.character(sdata$Global_reactive_power))
## change the type of Voltage to num
sdata$Voltage <- as.numeric(as.character(sdata$Voltage))
## change the type of Sub_metering to num
sdata$Sub_metering_1 <- as.numeric(as.character(sdata$Sub_metering_1))
sdata$Sub_metering_2 <- as.numeric(as.character(sdata$Sub_metering_2))

## plotting
par(mfrow = c(2,2), mar = c(4,4,2,2))
with(sdata, {
    plot(Datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
    plot(Datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    plot(Datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    points(Datetime, Sub_metering_2, type = "l", col = "red")
    points(Datetime, Sub_metering_3, type = "l", col = "blue")
    legend("topright", lty = 1, bty = "n", cex = 0.4, adj = c(0,0), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot(Datetime, Global_reactive_power, type = "l",xlab = "datetime", ylab = "Global_reactive_power")
})

dev.copy(png, file = "plot4.png")
dev.off()

## go back to original dir
setwd(olddir)
