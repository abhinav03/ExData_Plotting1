 data <- read.table('household_power_consumption.txt',header = T, sep =';', colClasses = 'character')
 
 data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
 newdata <- subset(data, Date == '2007-02-01' | Date == '2007-02-02')
 newdata$datetime <- as.POSIXlt(paste(newdata$Date,newdata$Time))
 newdata$Sub_metering_1 <- as.numeric(newdata$Sub_metering_1)
 newdata$Sub_metering_2 <- as.numeric(newdata$Sub_metering_2)
 newdata$Sub_metering_3 <- as.numeric(newdata$Sub_metering_3)
 
 png('plot3.png',width = 480, height = 480)
 plot(newdata$datetime, newdata$Sub_metering_1, type = 'l', ylab = ' Energy sub metering ', xlab = '')
 lines(newdata$datetime, newdata$Sub_metering_2, col = 'red')
 lines(newdata$datetime, newdata$Sub_metering_3, col = 'blue')
 legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty = 1, col = c('black','red', 'blue'))
 dev.off()



