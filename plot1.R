## Reading the input data from the file
inputFile <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
dataIn <- read.table(inputFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

## Extracting the required data according to dates
actualData <- dataIn[dataIn$Date %in% c("1/2/2007","2/2/2007"), ]

glb_active_pwr <- as.numeric(actualData$Global_active_power)
png("plot1.png", width=480, height = 480)

## Plotting a Histogram
hist(glb_active_pwr, col = "red",main = "Global Active Power", xlab = "Global Active Power (kilowatts")
title(main = "Global Active Power")

## Closing the graphics device to save the png file created.
dev.off()
