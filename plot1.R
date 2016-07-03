plot1 <- function(file_path) {
    # read in the file
    housePowerCons <- read.table(file_path, header = TRUE, sep = ";", na.strings = "?")
    # convert the date column to date format
    housePowerCons$Date <- as.Date(housePowerCons$Date, "%d/%m/%Y")
    # convert the time column to time format
    housePowerCons$Time <- strptime(paste(as.character(housePowerCons$Date), housePowerCons$Time), "%Y-%m-%d %H:%M:%S")
    # create a subset of just the two dates in question
    partofHousePowerCons <- rbind(housePowerCons[housePowerCons$Date == as.Date("2007-02-01"), ], housePowerCons[housePowerCons$Date == as.Date("2007-02-02"), ])

    # use png device
    png(file = "plot1.png", width = 480, height = 480, units = "px")

    # make the plot
    hist(partofHousePowerCons$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

    # turn off the png device
    dev.off()

}