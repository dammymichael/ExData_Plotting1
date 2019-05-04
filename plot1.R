getwd()
setwd("C:\\Users\\OMA DAMMY\\Desktop\\project")
#read data 
power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")

#subset the dataset to be used for the histogram
power_consumption_data <- subset(power_consumption, power_consumption$Date=="1/2/2007" | power_consumption$Date=="2/2/2007")

#plot the histogram
hist(as.numeric(as.character(power_consumption_data$Global_active_power)),col="red",main="Global Active Power",ylab = "Frequency", xlab="Global Active Power(kilowatts)")

dev.copy(png, file = "plot1.png")
dev.off()

