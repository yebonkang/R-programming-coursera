power <- read.table("data/household_power_consumption.txt",sep=";",header = T,na.strings="?")

power_data <- subset(power,Date %in% c("1/2/2007", "2/2/2007"))

power_data$Global_active_power <- as.numeric(power_data$Global_active_power)

power_data$datetime <- paste(power_data$Date, power_data$Time, sep=" ")
power_data[,c("Date", "Time")] <- list(NULL)
power_data$datetime <- strptime(power_data$datetime, format="%d/%m/%Y %H:%M:%S")

png(filename="plot2.png",height = 480, width=480)
with(power_data,plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
