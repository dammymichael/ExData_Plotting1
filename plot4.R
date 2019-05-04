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

#for multiple plots, par function is used
par(mfrow= c(2,2), mar = c(4,4,2,1), oma = c(0,0,1,0))
#plot4

plot(power_consumption_data$Global_active_power ~ power_consumption_data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

plot(power_consumption_data$Voltage ~ power_consumption_data$Datetime, type = "l", ylab = "Voltage (volts)", xlab = "")

with (power_consumption_data, { plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(Sub_metering_2~Datetime, col= "Red")
lines(Sub_metering_3~Datetime, col = "Blue") 
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,bty = "n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))})
plot(power_consumption_data$Global_reactive_power ~ power_consumption_data$Datetime, type = "l", ylab = "Global Reactive Power (kilowatts)", xlab ="")

dev.copy(png, file = "plot4.png")
dev.off()
