#read data

filename <- "household_power_consumption.txt"
Power <- read.table(filename, header = TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
subSetPower <- Power[Power$Date %in% c("1/2/2007","2/2/2007"),]


#plot histogram and write .png file

GlobalActivePower <- as.numeric(subSetPower$Global_active_power)
png("plot1.png", width = 480, height = 480)

hist(GlobalActivePower, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()