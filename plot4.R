dat<-read.table("C://Users//Luke//Documents//R//household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
str(dat)
dat$Date<-as.Date(dat$Date, format= "%d/%m/%Y")
str(data)
head(data)
data<-subset(dat, Date==as.Date("2007-2-1") | Date == as.Date("2007-2-2"))
head(data2)
DateTime<-paste(data$Date, data$Time)

data2<-data[,3:9]
str(final)
final<-cbind(DateTime, data2)
final$DateTime<- as.POSIXct(DateTime)

#plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,0,0))
plot(final$Global_active_power~final$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(final$Voltage~final$DateTime, type="l", xlab="datetime", ylab="Voltage")
plot(final$Sub_metering_1~final$DateTime,type="l", ylab="Energy sub metering", xlab="")
lines(final$Sub_metering_2~final$DateTime, col="red")
lines(final$Sub_metering_3~final$DateTime, col="blue")
legend("topright", col=c("black", "red", "blue"),lty=1, lwd=2, bty="n", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(final$Global_reactive_power~final$DateTime, type="l", xlab="datetime", ylab=" Global_Reactive_Power")
dev.copy(png, file="plot4.png", height=480, width=650)
dev.off()
getwd()
