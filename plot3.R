data1 <- read.table("household_power_consumption.txt", header = TRUE, 
                    sep=";",na.strings=c("NA","?"))
#summary(data1)
#names(data1)

data2 <-data1[which(!is.na(match(data1[,1],c("1/2/2007","2/2/2007")))),]
# fix(data2)
#sapply(data2,class)

DT <- paste(data2$Date,data2$Time)
datetime <- strptime(DT, "%d/%m/%Y %H:%M:%S")

# Third plot
plot(datetime, data2$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering", col="black")

lines(datetime, data2$Sub_metering_2, type="l", col="red")
lines(datetime, data2$Sub_metering_3, type="l", col="blue")

#?legend
legend("topright", lty=1, col=c("black","red","blue"), cex=0.5,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
