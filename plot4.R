data1 <- read.table("household_power_consumption.txt", header = TRUE, 
                    sep=";",na.strings=c("NA","?"))
#summary(data1)
#names(data1)

data2 <-data1[which(!is.na(match(data1[,1],c("1/2/2007","2/2/2007")))),]
# fix(data2)

DT <- paste(data2$Date,data2$Time)
datetime <- strptime(DT, "%d/%m/%Y %H:%M:%S")


par(mfrow=c(2,2))

# First plot
plot(datetime, data2$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")

# Second plot
plot(datetime, data2$Voltage, type="l", ylab="Voltage", 
     xlab="datetime")

# Third plot
plot(datetime, data2$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering", col="black")
lines(datetime, data2$Sub_metering_2, col="red")
lines(datetime, data2$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black","red","blue"), cex=0.3,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Fourth plot
plot(datetime, data2$Global_reactive_power, type="l",
     ylab="Global_reactive_power", xlab="datetime", xaxt="n")


dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
