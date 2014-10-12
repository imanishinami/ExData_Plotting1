#read data: Date, Time column are character, the rest are numeric data
data <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", colClasses = c

("character", "character", rep("numeric", 7)), na.strings = "?") 

#Change format of Date data 
data$Date<-as.Date(data$Date, "%d/%m/%Y") 

#Use only 2 days (2007-02-01 and 2007-02-02) 
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",] 

#MCombine Date and Time column
data$DateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

#create plot3.png file 
png(filename = "plot3.png") 
plot(x = data$DateTime, y = data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub 

metering") 

#Add lines
lines(x = data$DateTime, y = data$Sub_metering_1) 
lines(x = data$DateTime, y = data$Sub_metering_2, col = "red") 
lines(x = data$DateTime, y = data$Sub_metering_3, col = "blue") 

#Add legend  
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c

("black", "red", "blue"), lty = 1) 
dev.off() 
