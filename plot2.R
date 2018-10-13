plot2 <- function()
{
    # Read relevant data (1st and 2nd February 2007)
    
    electricData <- read.table(file="household_power_consumption.txt", header=T, sep=";", na.strings="?")
    electricData <- electricData[(electricData$Date=="1/2/2007") | (electricData$Date=="2/2/2007"),]
    
    
    
    # Summarize columns Date and Time into one new column DateAndTime and convert this into an actual time variable
    
    electricData <- cbind(DateAndTime=paste(electricData$Date, electricData$Time), electricData[,-c(1,2)])
    electricData$DateAndTime <- strptime(electricData$DateAndTime, format="%d/%m/%Y %H:%M:%S")
    
    
    
    # Plot the required diagram (saved into file "plot2.png")
    
    png("plot2.png", width=480, height=480)
    Sys.setlocale(category="LC_ALL", locale="english")          # Needed for the weekdays to be displayed in english
    with(electricData, plot(DateAndTime, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n"))
    with(electricData, lines(DateAndTime, Global_active_power))
    dev.off()
}