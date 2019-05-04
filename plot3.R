getwd()
setwd("C:\\Users\\OMA DAMMY\\Desktop\\project")
#read data 
power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")

#subset the dataset to be used for the histogram
power_consumption_data <- subset(power_consumption, power_consumption$Date=="1/2/2007" | power_consumption$Date=="2/2/2007")

#convert to time and date format
power_consumption_data$Date <- as.Date(power_consumption_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(power_consumption_data$Date), power_consumption_data$Time)
power_consumption_data$Datetime <- as.POSIXct(datetime)

with(power_consumption_data, { plot(Sub_metering_1 ~ Datetime, type="l", ylab="Energy sub metering", xlab="") 
  lines(Sub_metering_2~Datetime, col= "Red") 
  lines(Sub_metering_3~Datetime, col = "Blue") })

#include the legend

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# save the file
dev.copy(png, file = "plot3.png")
dev.off()

