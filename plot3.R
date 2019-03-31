## Reading the input data from the file
inputFile <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
dataIn <- read.table(inputFile, header = TRUE, sep = ";", stringsAsFactors = 
                       FALSE, dec = ".")

## Extracting the required data according to dates
actualData <- dataIn[dataIn$Date %in% c("1/2/2007","2/2/2007"), ]

## Getting only date and time information
datetime <- strptime(paste(actualData$Date, actualData$Time, sep = " "), 
                     "%d/%m/%Y %H:%M:%S")
glob_active_power <- as.numeric(actualData$Global_active_power)
subMetering1 <- as.numeric(actualData$Sub_metering_1)
subMetering2 <- as.numeric(actualData$Sub_metering_2)
subMetering3 <- as.numeric(actualData$Sub_metering_3)

##Plotting
png("plot3.png", width = 480, height = 480)
plot(datetime, subMetering1, type = "l", ylab = "Energy Sub metering", xlab="")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col="blue")
legend("topright", c("sub_Metering_1", "sub_Metering_2", "sub_Metering_3"), 
       lty = 1, lwd = 2, col = c("black", "red", "blue"))

## Closing the graphics device to save the png file created.
dev.off()