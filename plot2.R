data1 <- read.table("household_power_consumption.txt", header = TRUE, 
                    sep=";",na.strings=c("NA","?"))
#summary(data1)
#names(data1)

data2 <-data1[which(!is.na(match(data1[,1],c("1/2/2007","2/2/2007")))),]
# fix(data2)
#sapply(data2,class)

DT <- paste(data2$Date,data2$Time)
datetime <- strptime(DT, "%d/%m/%Y %H:%M:%S")

# Second plot
plot(datetime, data2$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")


dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()