# read data
cnames <- read.table('household_power_consumption.txt',
                     sep = ";",nrows=1,header=TRUE)
cnames <- names(cnames)
data <- read.table('household_power_consumption.txt',
                   header=TRUE, sep = ";",
                   skip = 66636,nrows = 2880,
                   col.names = cnames)

# histogram of global active power
png("plot1.png")
hist(data$Global_active_power,
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red")
dev.off()

