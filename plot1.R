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

##Write the .png
png(file="plot1.png", height=480, width=480)
hist(consumsub$Global_active_power, col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()