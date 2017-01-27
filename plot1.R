# Read the data
data<-read.table("household_power_consumption.txt", header = TRUE, sep =";", 
                 na.strings = "?")
#subset the data for plotting using the date conditon
usedata<-subset(data, data$Date %in% c("1/2/2007","2/2/2007"))
# Saving the plot as a png 
png(filename="plot1.png")
# Plot a histogram
hist(usedata$Global_active_power, col ='red', xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()