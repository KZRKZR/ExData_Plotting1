##assume file located at working directory 
## read data
test<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c("character", "character",rep("numeric",7)),na.strings="?")

## only two dates
need<-test[test$Date=="1/2/2007"|test$Date=="2/2/2007",]

## add datetime column
need$DateTime <- as.POSIXct(paste(need$Date, need$Time), format="%d/%m/%Y %H:%M:%S")

##set locale
Sys.setlocale("LC_ALL","C")

##plot
png(width=480, height=480,file = "plot3.png")
plot(need$DateTime,need$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black")
points(need$DateTime,need$Sub_metering_2,type="l",col="red")
points(need$DateTime,need$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,cex=0.95)
dev.off()