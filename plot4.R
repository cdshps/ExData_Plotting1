plot4 <- function()
{
    # Read relevant data (1st and 2nd February 2007)
    
    electricData <- read.table(file="household_power_consumption.txt", header=T, sep=";", na.strings="?")
    electricData <- electricData[(electricData$Date=="1/2/2007") | (electricData$Date=="2/2/2007"),]
    
    
    
    # Summarize columns Date and Time into one new column DateAndTime and convert this into an actual time variable
    
    electricData <- cbind(DateAndTime=paste(electricData$Date, electricData$Time), electricData[,-c(1,2)])
    electricData$DateAndTime <- strptime(electricData$DateAndTime, format="%d/%m/%Y %H:%M:%S")
    
    
    
    # Plot the required diagram (saved into file "plot4.png")
    
    png("plot4.png", width=480, height=480)
    Sys.setlocale(category="LC_ALL", locale="english")          # Needed for the weekdays to be displayed in english
    
        # Set plotting parameters so that four plots will be displayed
    
    par(mfrow=c(2,2))
    
        # Upper left plot
    
    with(electricData, plot(DateAndTime, Global_active_power, xlab="", ylab="Global Active Power", type="n"))
    with(electricData, lines(DateAndTime, Global_active_power))
    
        # Upper right plot
    
    with(electricData, plot(DateAndTime, Voltage, xlab="datetime", type="n"))
    with(electricData, lines(DateAndTime, Voltage))
    
        # Lower left plot
    
    with(electricData, plot(DateAndTime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="n"))
    with(electricData, lines(DateAndTime, Sub_metering_1))
    with(electricData, lines(DateAndTime, Sub_metering_2, col="red"))
    with(electricData, lines(DateAndTime, Sub_metering_3, col="blue"))
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1, bty="n")
    
        # Lower right plot
    
    with(electricData, plot(DateAndTime, Global_reactive_power, xlab="datetime", type="n"))
    with(electricData, lines(DateAndTime, Global_reactive_power))
    
        # End plotting
    
    dev.off()
}