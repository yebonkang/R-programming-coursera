power <- read.table("data/household_power_consumption.txt",sep=";",header = T,na.strings="?")

power_data <- subset(power,Date %in% c("1/2/2007", "2/2/2007"))

power_data$datetime <- paste(power_data$Date, power_data$Time, sep=" ")
power_data[,c("Date", "Time")] <- list(NULL)
power_data$datetime <- strptime(power_data$datetime, format="%d/%m/%Y %H:%M:%S")

png(filename="plot3.png",height = 480, width=480)
with(power_data,plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(power_data,lines(datetime, Sub_metering_1))
with(power_data,lines(datetime, Sub_metering_2, col="red"))
with(power_data,lines(datetime, Sub_metering_3, col="blue"))
legend("topright",col=c("black","red","blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
