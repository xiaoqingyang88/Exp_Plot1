## Week 1 Plot


setwd ('C:/R Course/Exploratory_Data_Analysis/Week1')

## Load the data
power <- read.table("household_power_consumption.txt", header = TRUE, sep =";")

dim(power)
names(power)

## Subset the data 
subset_1 <- power[which(power$Date == "1/2/2007") ,]
subset_2 <- power[which(power$Date == "2/2/2007") ,]

mydata <- rbind(subset_1, subset_2)
mydata$Global_active_power <-  as.numeric(as.character(mydata$Global_active_power))

## Construct Plot

# 1: Frequency of Global_active_power
names(mydata)

hist(mydata$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

dev.copy(png, file = "plot1.png") 
dev.off() 







