
# Read the data
data<-read.table("household_power_consumption.txt", header = TRUE, sep =";", 
                 na.strings = "?")
#subset the data for plotting using the date conditon
usedata<-subset(data, data$Date %in% c("1/2/2007","2/2/2007"))

#convert the Date and Time variables to Date/Time classes in R
datetime<-paste(usedata$Date, usedata$Time)
usedata2<-strptime(datetime, format='%d/%m/%Y %H:%M:%S')
# Saving the plot as a png 
png(filename="plot2.png")
# Plot date&time vs Global_active_power
plot(usedata2, usedata$Global_active_power, type = "l", xlab = " ", ylab = "Global active power (kilowatts)")
dev.off()