electricity <- read.table("/home/coda/Documents/Data Science/4. Exploratory Data Analysis/Week 1/Assignments/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
#colnames(electricity) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
electricity <- electricity[electricity$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(electricity$Date, electricity$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(
  electricity,
  {
    globalActivePower <- as.numeric(electricity$Global_active_power)
    voltage <- as.numeric(electricity$Voltage)
    global_reactive_power <- as.numeric(electricity$Global_reactive_power)
    plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power", ylim = c(0, 7))
    plot(datetime, Voltage, xlab = "datetime", ylab = "Voltage", type = "l", ylim = c(234, 247))
    energy_sub_metering1 <- as.numeric(electricity$Sub_metering_1)
    energy_sub_metering2 <- as.numeric(electricity$Sub_metering_2)
    energy_sub_metering3 <- as.numeric(electricity$Sub_metering_3)
    plot(datetime, energy_sub_metering1, col = "black", type = "l", ylab = "Energy sub metering", xlab = "")
    lines(datetime, energy_sub_metering2, col = "red", type = "l")
    lines(datetime, energy_sub_metering3, col = "blue", type = "l")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5, col=c("black", "red", "blue"), cex = 0.50)
    plot(datetime, global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l", ylim = c(0.1, 0.6))
  }
)

dev.copy(png, "/home/coda/Documents/Data Science/4. Exploratory Data Analysis/Week 1/Assignments/plot4.png")
dev.off()


