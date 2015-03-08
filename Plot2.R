## Week 1 Plot

library(jpeg)

setwd ('C:/R Course/Exploratory_Data_Analysis/Week1')

## Load the data
power <- read.table("household_power_consumption.txt", header = TRUE, sep =";")

dim(power)
names(power)

## Subset the data 
subset_1 <- power[which(power$Date == "1/2/2007") ,]
subset_2 <- power[which(power$Date == "2/2/2007") ,]

mydata <- rbind(subset_1, subset_2)


## Construct Plot
# 2: Time to Global_active_power

## Converting dates


mydata$datetime <- as.POSIXct(strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S", tz="GMT"))

mydata$Global_active_power <- as.numeric(as.character(mydata$Global_active_power))


plot( mydata$Global_active_power ~ mydata$datetime, type="l", 
                  xlab="", ylab="Global Active Power (kilowatts)", col="blue")

dev.copy(png, file="plot2.png")
dev.off()






