#read data: Date, Time column are character, the rest are numeric data
data <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", colClasses = c("character", "character", rep("numeric", 7)), na.strings = "?") 

#Change format of Date data 
data$Date<-as.Date(data$Date, "%d/%m/%Y") 

#Use only 2 days (2007-02-01 and 2007-02-02) 
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",] 

#create plot1.png file and extract histogram 
#The main title: Global Active Power
#X axis label:  Global Active Power (kilowatts)
#Y axis label:  Frequency
#plotting color: red

png(filename = "plot1.png", width = 480, height = 480, units = "px") 
with(data, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")) 
dev.off() 
