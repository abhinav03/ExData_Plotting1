 data <- read.table('household_power_consumption.txt',header = T, sep =';', colClasses = 'character')
 
 data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
 newdata <- subset(data, Date == '2007-02-01' | Date == '2007-02-02')
 newdata$datetime <- as.POSIXlt(paste(newdata$Date,newdata$Time))
 
 newdata$Global_active_power <- as.numeric(newdata$Global_active_power)

 png('plot2.png',width = 480, height = 480)
 plot(newdata$datetime, newdata$Global_active_power, type = 'l', ylab = ' Global Active Power(kilowatts)', xlab = '')
 dev.off()
