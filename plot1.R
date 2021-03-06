electricity <- read.table("/home/coda/Documents/Data Science/4. Exploratory Data Analysis/Week 1/Assignments/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
#colnames(electricity) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
electricity <- electricity[electricity$Date %in% c("1/2/2007","2/2/2007") ,]
hist(as.numeric(electricity$Global_active_power), xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")
dev.copy(png, "/home/coda/Documents/Data Science/4. Exploratory Data Analysis/Week 1/Assignments/plot1.png")
dev.off()


