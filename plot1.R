## making Plot 1
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
## transforming the column
sdata$Global_active_power <- as.numeric(as.character(sdata$Global_active_power))

## plotting

hist(sdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()

## go back to original dir
setwd(olddir)
