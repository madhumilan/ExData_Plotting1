## Reading the input data from the file
inputFile <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
dataIn <- read.table(inputFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

## Extracting the required data according to dates
actualData <- dataIn[dataIn$Date %in% c("1/2/2007","2/2/2007"), ]

## Getting only date and time information
datetime <- strptime(paste(actualData$Date, actualData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
glob_active_power <- as.numeric(actualData$Global_active_power)
png("plot2.png", width=480, height = 480)

## Plotting datetime v/s Global Active Power
plot(datetime, glob_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

## Closing the graphics device to save the png file created.
dev.off()