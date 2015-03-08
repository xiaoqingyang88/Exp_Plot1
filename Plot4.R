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
# 4:Time to multiple variables

## Converting dates


mydata$datetime <- as.POSIXct(strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S", tz="GMT"))

mydata$Global_active_power <-  as.numeric(as.character(mydata$Global_active_power))
mydata$Global_reactive_power <-  as.numeric(as.character(mydata$Global_reactive_power))
mydata$Voltage <-  as.numeric(as.character(mydata$Voltage))
mydata$Sub_metering_1 <- as.numeric(as.character(mydata$Sub_metering_1))
mydata$Sub_metering_2 <- as.numeric(as.character(mydata$Sub_metering_2))

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

with(mydata, {
  plot(Global_active_power~datetime, type="l")
  plot(Voltage~datetime, type="l", xlab="datetime")
  plot(Sub_metering_1~datetime, type="l")
    lines(Sub_metering_2~datetime,col='Red')
    lines(Sub_metering_3~datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5, bty="n")
    
  plot(Global_reactive_power~datetime, type="l", xlab="datetime")
})



dev.copy(png, file="plot4.png")
dev.off()





