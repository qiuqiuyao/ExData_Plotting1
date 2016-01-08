##read in the data set and subset the data set
initial<-read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=100)
classes<-sapply(initial,class)
hpc<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",colClasses=classes,comment.char="")
hpcsub<-subset(hpc,hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007")

##make the graph
datetime <- strptime(paste(hpcsub$Date, hpcsub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(datetime, hpcsub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
