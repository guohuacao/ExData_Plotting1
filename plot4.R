
#  read the data into R
dataFile <- "../data/household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep = ';', stringsAsFactors = FALSE, dec ='.')

subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot the data
dayTime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalAtivePower = as.numeric(subData$Global_active_power)
globalReativePower = as.numeric(subData$Global_reactive_power)
voltage = as.numeric(subData$Voltage)
subMetering1 <- as.numeric(subData$Sub_metering_1)
subMetering2 <- as.numeric(subData$Sub_metering_2)
subMetering3 <- as.numeric(subData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(dayTime, globalAtivePower, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(dayTime, voltage, type = "l", xlab="datetime", ylab="Voltage")
plot(dayTime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(dayTime, subMetering2, type="l", col = "red")
lines(dayTime, subMetering3, type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(dayTime, globalReativePower, type = "l", xlab="datetime", ylab="Global_reactive_power")
dev.off()