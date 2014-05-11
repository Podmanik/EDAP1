consumption<-read.table("C:/Exploratory Data Analysis/household_power_consumption.txt",sep=";",header=T)
consumption$Date<-as.Date(as.character(consumption$Date), "%d/%m/%y")

##Need to read these as strings - not as real dd/mm/yyyy dates
consumsub<-consumption[which(consumption$Date=='2007-02-02' | consumption$Date=="2007-02-01"),]


##Converts characters to decimals
consumsub$Global_active_power<-type.convert(as.character(consumsub$Global_active_power), dec = ".")
consumsub$Sub_metering_1<-type.convert(as.character(consumsub$Sub_metering_1), dec = ".")
consumsub$Sub_metering_2<-type.convert(as.character(consumsub$Sub_metering_2), dec = ".")
consumsub$Sub_metering_3<-type.convert(as.character(consumsub$Sub_metering_3), dec = ".")
consumsub$Global_reactive_power<-type.convert(as.character(consumsub$Global_reactive_power), dec = ".")
consumsub$Voltage<-type.convert(as.character(consumsub$Voltage), dec = ".")

##Merge date and time
consumsub$timestamp<-as.POSIXlt(paste(consumsub$Date, consumsub$Time), "%d/%m/%Y %H:%M:%S")

##Write the third .png
png(file="plot3.png", height=480, width=480)
plot(consumsub$timestamp,consumsub$Sub_metering_1,pch=26,xlab="",ylab="Energy sub metering",main="",yaxt='n')
lines(consumsub$timestamp,consumsub$Sub_metering_1,type="o",col="black",pch=26)
lines(consumsub$timestamp,consumsub$Sub_metering_2,type="o",col="red",pch=26)
lines(consumsub$timestamp,consumsub$Sub_metering_3,type="o",col="blue",pch=26)
axis(2,at=seq(0,38,10),labels=T)
legend("topright", lty = 1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()