
## 0.0. Reading data

 data <- read.table("C:/Users/francisca.marinho/Documents/Data Science Specialization/04. Exploratory Analysis/household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)


## 0.1. Useful packages 

library(dplyr)
library(lubridate)


## 0.1. subsetting 2007-02-01 and 2007-02-02

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
dataset <-data %>% filter(Date >="2007-02-01", Date <= "2007-02-02" )


## 1.0. Plot 1

dataset$Global_active_power <- as.numeric(dataset$Global_active_power) ## because it was defined as character
png(file = "plot1.png")
hist(dataset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()


## 2.0. Plot 2

dataset$datetime <- strptime(paste(dataset$Date, dataset$Time), "%Y-%m-%d %H:%M:%S") ## combine date and time
png(file = "plot2.png")
plot(dataset$datetime, dataset$Global_active_power, type ="l", xlab = "",  ylab = "Global Active Power (kilowatts)")
dev.off()


## 3.0. Plot 3

png(file = "plot3.png")
plot(dataset$datetime, dataset$Sub_metering_1, xlab ="", ylab="Energy sub metering", type="l")
lines(dataset$datetime, dataset$Sub_metering_2, col = "red")
lines(dataset$datetime, dataset$Sub_metering_3, col = "blue")
legend("topright",lty = 1, col = c("black", "red", "blue"), legend = c("sub_metering_1","sub_metering_2", "sub_metering_3"))
dev.off()


## 4.0. Plot 4

png(file = "plot4.png")
par(mfrow=c(2,2))
# 1st
plot(dataset$datetime, dataset$Global_active_power,  ylab = "Global Active Power", type = "l")
#2nd
plot(dataset$datetime, dataset$Voltage, xlab ="datetime", ylab = "Voltage", type = "l")
#3rd
plot(dataset$datetime, dataset$Sub_metering_1, xlab ="", ylab="Energy sub metering", type="l")
lines(dataset$datetime, dataset$Sub_metering_2, col = "red")
lines(dataset$datetime, dataset$Sub_metering_3, col = "blue")
legend("topright",lty = 1, col = c("black", "red", "blue"), legend = c("sub_metering_1","sub_metering_2", "sub_metering_3"), cex = 0.4)
#4th
plot(dataset$datetime, dataset$Global_reactive_power, type ="l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()