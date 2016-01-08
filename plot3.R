##read in the data set and subset the data set
initial<-read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=100)
classes<-sapply(initial,class)
hpc<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",colClasses=classes,comment.char="")
hpcsub<-subset(hpc,hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007")

##make the plot
datetime <- strptime(paste(hpcsub$Date, hpcsub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot3.png",width=480,height=480)
par(mar=c(8.5,4,4,2))
plot(datetime,hpcsub$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(datetime,hpcsub$Sub_metering_2,col="red")
lines(datetime,hpcsub$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty="solid",col=c("black","red","blue"))
dev.off()