power <- read.table("data/household_power_consumption.txt",sep=";",header = T,na.strings="?")

power_data <- subset(power,Date %in% c("1/2/2007", "2/2/2007"))

power_data$Global_active_power <- as.numeric(power_data$Global_active_power)

power_data$datetime <- paste(power_data$Date, power_data$Time, sep=" ")
power_data[,c("Date", "Time")] <- list(NULL)
power_data$datetime <- strptime(power_data$datetime, format="%d/%m/%Y %H:%M:%S")


png(filename="plot4.png",height = 480, width=480)
par(mfrow=c(2,2),mar=c(4.5,4.5,2.5,1.5))
with(power_data,plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(power_data,plot(datetime, Voltage, type="l", ylab="Voltage"))

with(power_data,plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")) 
lines(power_data$datetime, power_data$Sub_metering_1)
lines(power_data$datetime, power_data$Sub_metering_2,col="red")
lines(power_data$datetime, power_data$Sub_metering_3, col="blue")
legend("topright",col=c("black","red","blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n")

with(power_data,plot(datetime, Global_reactive_power, type="l"))
dev.off()
