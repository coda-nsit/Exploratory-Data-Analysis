electricity <- read.table("/home/coda/Documents/Data Science/4. Exploratory Data Analysis/Week 1/Assignments/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
#colnames(electricity) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
electricity <- electricity[electricity$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(electricity$Date, electricity$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

energy_sub_metering1 <- as.numeric(electricity$Sub_metering_1)
energy_sub_metering2 <- as.numeric(electricity$Sub_metering_2)
energy_sub_metering3 <- as.numeric(electricity$Sub_metering_3)

plot(datetime, energy_sub_metering1, col = "black", type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime, energy_sub_metering2, col = "red", type = "l")
lines(datetime, energy_sub_metering3, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=5.5, col=c("black", "red", "blue"))
dev.copy(png, "/home/coda/Documents/Data Science/4. Exploratory Data Analysis/Week 1/Assignments/plot3.png")
dev.off()


