# read data
cnames <- read.table('household_power_consumption.txt',
                     sep = ";",nrows=1,header=TRUE)
cnames <- names(cnames)
data <- read.table('household_power_consumption.txt',
                   header=TRUE, sep = ";",
                   skip = 66636,nrows = 2880,
                   col.names = cnames)
# convert to datetime
data <- transform(data,Datetime = strptime(paste(Date,Time),
                                           '%d/%m/%Y %H:%M:%S'))

png("plot4.png")
par(mfrow = c(2,2))

# plot global active power
plot(data$Datetime,data$Global_active_power,type = "n",
     xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data$Datetime,data$Global_active_power)

# plot voltage
plot(data$Datetime,data$Voltage,type = "n",
     xlab = "datetime", ylab = "Voltage")
lines(data$Datetime,data$Voltage)

# plot sub metering
plot(data$Datetime,data$Sub_metering_1,type = "n",
     xlab = "", ylab = "Energy sub metering")
lines(data$Datetime,data$Sub_metering_1)
lines(data$Datetime,data$Sub_metering_2, col = "red")
lines(data$Datetime,data$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"), lty = c(1,1,1))

# plot global reactive power
plot(data$Datetime,data$Global_reactive_power,type = "n",
     xlab = "datetime", ylab = "Global_reactive_power")
lines(data$Datetime,data$Global_reactive_power)


dev.off()