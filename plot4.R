plot4 <- function(file_path) {
    # read in the file
    housePowerCons <- read.table(file_path, header = TRUE, sep = ";", na.strings = "?")
    # convert the date column to date format
    housePowerCons$Date <- as.Date(housePowerCons$Date, "%d/%m/%Y")
    # convert the time column to time format
    housePowerCons$Time <- strptime(paste(as.character(housePowerCons$Date), housePowerCons$Time), "%Y-%m-%d %H:%M:%S")
    # create a subset of just the two dates in question
    partofHousePowerCons <- rbind(housePowerCons[housePowerCons$Date == as.Date("2007-02-01"), ], housePowerCons[housePowerCons$Date == as.Date("2007-02-02"), ])

    # use png device
    png(file = "plot4.png", width = 480, height = 480, units = "px")

    # make the plot
    plot(partofHousePowerCons$Time, partofHousePowerCons$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = NA)
    lines(partofHousePowerCons$Time, partofHousePowerCons$Sub_metering_2, col = "red")
    lines(partofHousePowerCons$Time, partofHousePowerCons$Sub_metering_3, col = "blue")
    legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

    # turn off the png device
    dev.off()

}