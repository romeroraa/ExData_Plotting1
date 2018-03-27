#read data

filename <- "household_power_consumption.txt"
Power <- read.table(filename, header = TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
subSetPower <- Power[Power$Date %in% c("1/2/2007","2/2/2007"),]


#plot and write .png file

date_and_time <- strptime(paste(subSetPower$Date, subSetPower$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(subSetPower$Global_active_power)
GlobalReactivePower <- as.numeric(subSetPower$Global_reactive_power)
voltage <- as.numeric(subSetPower$Voltage)
submeter1 <- as.numeric(subSetPower$Sub_metering_1)
submeter2 <- as.numeric(subSetPower$Sub_metering_2)
submeter3 <- as.numeric(subSetPower$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(date_and_time, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)", cex = 0.25)
plot(date_and_time,voltage,type="l",xlab="datetime",ylab="voltage")

plot(date_and_time, submeter1, type="l", ylab="Energy sub metering", xlab="")
lines(date_and_time,submeter2,type="l",col="red")
lines(date_and_time,submeter3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=3, col=c("black","red","blue"))

dev.off()