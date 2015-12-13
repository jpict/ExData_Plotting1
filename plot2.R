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

# plot of global active power
png("plot2.png")
plot(data$Datetime,data$Global_active_power,type = "n",
     xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data$Datetime,data$Global_active_power)
dev.off()