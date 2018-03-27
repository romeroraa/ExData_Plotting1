#read data

filename <- "household_power_consumption.txt"
Power <- read.table(filename, header = TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
subSetPower <- Power[Power$Date %in% c("1/2/2007","2/2/2007"),]


#plot and write .png file

date_and_time <- strptime(paste(subSetPower$Date, subSetPower$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

GlobalActivePower <- as.numeric(subSetPower$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(date_and_time, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()