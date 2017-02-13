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

#plot1
hist(final$Global_active_power, col="red", main= "Global Active Power", xlab= "Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", height=480, width=650)
dev.off()
