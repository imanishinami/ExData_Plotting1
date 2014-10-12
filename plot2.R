#read data: Date, Time column are character, the rest are numeric data
data <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", colClasses = c("character", "character", rep("numeric", 7)), na.strings = "?") 

#Change format of Date data 
data$Date<-as.Date(data$Date, "%d/%m/%Y") 

#Use only 2 days (2007-02-01 and 2007-02-02) 
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",] 

#MCombine Date and Time column
data$DateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S") 

#create plot2.png file
png(filename = "plot2.png") 
plot(x = data$DateTime, y = data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)") 
dev.off() 
