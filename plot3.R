## making Plot 3
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
## change the type of Sub_metering to num
sdata$Sub_metering_1 <- as.numeric(as.character(sdata$Sub_metering_1))
sdata$Sub_metering_2 <- as.numeric(as.character(sdata$Sub_metering_2))

## plotting
with(sdata,plot(Datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(sdata, points(Datetime, Sub_metering_2, type = "l", col = "red"))
with(sdata, points(Datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, cex = 0.5, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()

## go back to original dir
setwd(olddir)
