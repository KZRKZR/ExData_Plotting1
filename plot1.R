## read data
test<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c("character", "character"),na.strings="?")
## only two dates
need<-test[test$Date=="1/2/2007"|test$Date=="2/2/2007",]
## convert to numeric
need[, c(3:9)] <- sapply(need[, c(3:9)], as.numeric)
## add datetime column
need$DateTime <- as.POSIXct(paste(need$Date, need$Time), format="%d/%m/%Y %H:%M:%S")
##plot
png(width=480, height=480,file = "plot1.png")
hist(need$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (killowatts)")
dev.off()
