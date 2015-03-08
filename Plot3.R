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
# 3:Time to Sub_metering

## Converting dates


mydata$datetime <- as.POSIXct(strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S", tz="GMT"))

mydata$Sub_metering_1 <- as.numeric(as.character(mydata$Sub_metering_1))
mydata$Sub_metering_2 <- as.numeric(as.character(mydata$Sub_metering_2))

with(mydata, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



dev.copy(png, file="plot3.png")
dev.off()





