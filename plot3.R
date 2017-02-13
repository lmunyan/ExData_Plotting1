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

#plot3
plot(final$Sub_metering_1~final$DateTime,type="l", ylab="Energy sub metering", xlab="")
lines(final$Sub_metering_2~final$DateTime, col="red")
lines(final$Sub_metering_3~final$DateTime, col="blue")
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=650)
dev.off()
