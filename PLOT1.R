agus <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";",colClasses=c("character", "character", rep("numeric",7)),  na="?")
head(agus)
agus1 <- agus[ which(agus$Date=='1/2/2007' | agus$Date=='2/2/2007'), ]
agus1$Time <- strptime(paste(agus1$Date, agus1$Time), "%d/%m/%Y %H:%M:%S")
agus1$Date <- as.Date(agus1$Date, "%d/%m/%Y")

#Plot 1

png("plot1.png", width=480, height=480)
hist( agus1$Global_active_power, main="Global Active Power",
      xlab="Global Active Power (kilowatts)",
      ylab="Frequency",
      col="red" )
