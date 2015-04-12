## read data
test<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c("character", "character"))
## only two dates
need<-test[test$Date=="1/2/2007"|test$Date=="2/2/2007",]
need[need=="?"]<-"NA"
## convert to numeric
need[, c(3:9)] <- sapply(need[, c(3:9)], as.numeric)
## add datetime column
need$DateTime <- as.POSIXct(paste(need$Date, need$Time), format="%d/%m/%Y %H:%M:%S")
##set locale
Sys.setlocale("LC_ALL","C")
##plot
png(width=480, height=480,file = "plot2.png")
plot(need$DateTime,need$Global_active_power,type="l",ylab="Global Active Power (killowatts)",xlab="")
dev.off()