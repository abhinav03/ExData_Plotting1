 data <- read.table('household_power_consumption.txt',header = T, sep =';', colClasses = 'character')
 
 data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
 newdata <- subset(data, Date == '2007-02-01' | Date == '2007-02-02')
 newdata$datetime <- as.POSIXlt(paste(newdata$Date,newdata$Time))
 newdata$Sub_metering_1 <- as.numeric(newdata$Sub_metering_1)
 newdata$Sub_metering_2 <- as.numeric(newdata$Sub_metering_2)
 newdata$Sub_metering_3 <- as.numeric(newdata$Sub_metering_3)
 newdata$Global_active_power <- as.numeric(newdata$Global_active_power)
 newdata$Voltage <- as.numeric(newdata$Voltage)
 newdata$Global_reactive_power <- as.numeric(newdata$Global_reactive_power)

 png('plot4.png',width = 480, height = 480)

 par(mfrow = c(2,2))

 plot(newdata$datetime, newdata$Global_active_power, type = 'l', ylab = ' Global Active Power(kilowatts)', xlab = '')
 
 plot(newdata$datetime, newdata$Voltage, type = 'l', ylab = 'Voltage', xlab = ' datetime ')

 plot(newdata$datetime, newdata$Sub_metering_1, type = 'l', ylab = ' Energy sub metering ', xlab = '')
 lines(newdata$datetime, newdata$Sub_metering_2, col = 'red')
 lines(newdata$datetime, newdata$Sub_metering_3, col = 'blue')
 legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty = 1, col = c('black','red', 'blue'))
 
 plot(newdata$datetime, newdata$Global_reactive_power, type = 'l', ylab = 'Global_reactive_power', xlab = ' datetime ')

 dev.off()



