#getwd()
data1 <- read.table("household_power_consumption.txt", header = TRUE, sep=";",na.strings=c("NA","?"))
#summary(data1)
names(data1)


data2 <-data1[which(!is.na(match(data1[,1],c("1/2/2007","2/2/2007")))),]
# fix(data2)
#sapply(data2,class)


hist(data2$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

