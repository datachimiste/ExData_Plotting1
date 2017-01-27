
# Read the data
data<-read.table("household_power_consumption.txt", header = TRUE, sep =";", 
                 na.strings = "?")
#subset the data for plotting using the date conditon
usedata<-subset(data, data$Date %in% c("1/2/2007","2/2/2007"))

#convert the Date and Time variables to Date/Time classes in R
datetime<-paste(usedata$Date, usedata$Time)
usedata2<-strptime(datetime, format='%d/%m/%Y %H:%M:%S')
png(filename="plot4.png")
# create a plot with two rows and two column
par(mfcol = c(2,2))
# Plot date & time vs Global active power
plot(usedata2, usedata$Global_active_power, type = "l", xlab = " ", ylab = "Global active power (kilowatts)")
# Plot date & time vs Energy sub metering
plot(usedata2, usedata$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")
lines(usedata2, usedata$Sub_metering_2, col = "red" )
lines(usedata2, usedata$Sub_metering_3, col = "blue" )
legend("topright", lwd = 1, legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red", "blue" ))
# Plot date & time vs Voltage
plot(usedata2, usedata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(usedata2, usedata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
# Reset the margin
par(mar = c(2,2,1,1))
dev.off()