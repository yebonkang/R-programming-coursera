power <- read.table("data/household_power_consumption.txt",sep=";",header = T)

power_data <- subset(power,Date %in% c("1/2/2007", "2/2/2007"))

power_data$Global_active_power <- as.numeric(power_data$Global_active_power)

png(filename="plot1.png",height = 480, width=480)
with(power_data, hist(Global_active_power, col="red", main= "Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency"))
dev.off()
