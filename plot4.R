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
glob_reactive_power <- as.numeric(actualData$Global_reactive_power)
voltage <- as.numeric(actualData$Voltage)
subMetering1 <- as.numeric(actualData$Sub_metering_1)
subMetering2 <- as.numeric(actualData$Sub_metering_2)
subMetering3 <- as.numeric(actualData$Sub_metering_3)

## Creating a plot by name plot4.png
png("plot4.png", width = 480, height = 480)

## For creating 2 by 2 plot window
par(mfrow = c(2,2))


## Plot1 - Date&Time v/s Global Active Power
plot(datetime, glob_active_power, type = "l", xlab="", ylab="Global Active Power")

##Plot2 - Date&Time v/s Vlotage
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

##Plot3 - Datetime v/s Sub_Metering_Values
plot(datetime, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime, subMetering2, type = "l", col="red")
lines(datetime, subMetering3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  lty = , lwd = 2.5, col = c("black", "red", "blue"))


## Plot4 Datet&Time v/s Global_Reactive_Power
plot(datetime, glob_reactive_power, type = "l", xlab = "datetime", 
      ylab = "Global_reactive_power")

## Closing the graphics device to save the png file created.
dev.off()
