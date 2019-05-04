getwd()
setwd("C:\\Users\\OMA DAMMY\\Desktop\\project")
#read data 

power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")

#subset the dataset
power_consumption_data <- subset(power_consumption, power_consumption$Date=="1/2/2007" | power_consumption$Date=="2/2/2007")

#convert to time and date format
power_consumption_data$Date <- as.Date(power_consumption_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(power_consumption_data$Date), power_consumption_data$Time)
power_consumption_data$Datetime <- as.POSIXct(datetime)

#plot 2
plot(power_consumption_data$Global_active_power ~ power_consumption_data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
     
     #{plot(Global_active_power~Datetime, 

dev.copy(png, file = "plot2.png")
dev.off()  
