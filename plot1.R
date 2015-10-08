
#  read the data into R
dataFile <- "../data/household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep = ';', stringsAsFactors = FALSE, dec ='.')

subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot the data
png("plot1.png", width=480, height=480)
globalAtivePower = as.numeric(subData$Global_active_power)
hist(globalAtivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()