## making Plot 2
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
## change the type of Global_active_power to num
sdata$Global_active_power <- as.numeric(as.character(sdata$Global_active_power))


## plotting
par(mar = c(4,4,2,1))
with(sdata, plot(Datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png")
dev.off()

## go back to original dir
setwd(olddir)
