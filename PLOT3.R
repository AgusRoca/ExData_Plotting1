agus <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";",colClasses=c("character", "character", rep("numeric",7)),  na="?")
head(agus)
agus1 <- agus[ which(agus$Date=='1/2/2007' | agus$Date=='2/2/2007'), ]
agus1$Time <- strptime(paste(agus1$Date, agus1$Time), "%d/%m/%Y %H:%M:%S")
agus1$Date <- as.Date(agus1$Date, "%d/%m/%Y")


#Plot 3
png("plot3.png", width=480, height=480)
plot(agus1$Time, agus1$Sub_metering_1, type="l", col="black",
xlab="", ylab="Energy sub metering")
lines(agus1$Time, agus1$Sub_metering_2, col="red")
lines(agus1$Time, agus1$Sub_metering_3, col="blue")
legend("topright",
col=c("black", "red", "blue"),
c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
lty=1)
