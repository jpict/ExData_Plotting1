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

# plot of sub metering
png("plot3.png")
plot(data$Datetime,data$Sub_metering_1,type = "n",
     xlab = "", ylab = "Energy sub metering")
lines(data$Datetime,data$Sub_metering_1)
lines(data$Datetime,data$Sub_metering_2, col = "red")
lines(data$Datetime,data$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"), lty = c(1,1,1))
dev.off()