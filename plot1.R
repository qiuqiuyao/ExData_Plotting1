##read in the data set and subset the data set
initial<-read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=100)
classes<-sapply(initial,class)
hpc<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",colClasses=classes,comment.char="")
hpcsub<-subset(hpc,hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007")

#plot the histogram of global active power
png(filename="plot1.png",width=480, height=480)
par(mar=c(8.5,4,4,2))
hist(hpcsub$Global_active_power,col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")
dev.off()
