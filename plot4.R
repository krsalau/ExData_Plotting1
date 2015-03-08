# Author: Kehinde Rilwan Salau
#         kehinde.salau@gmail.com
#         krsalau@email.arizona.edu
# Created: Mar 6th, 2015
#
#This assignment uses data from the UC Irvine Machine Learning Repository, a 
#popular repository for machine learning datasets. In particular, we will be 
#using the "Individual household electric power consumption Data Set"
#
#See https://github.com/krsalau/ExData_Plotting1 for details on the variables
#of the dataset
#
#This code will generate 4 plots, (1) A time series of Global Active Power
#(2) Time series for each Energy sub metering, (3) A time series of Voltage,
#(4) A time series of Global_reactive_power
################################################################################

##Load in the data specific to the dates 2007/02/01 and 2007/02/02
Fulldata <- read.table("household_power_consumption.txt",sep = ";",header=TRUE)
data <- subset(Fulldata, Fulldata$Date == "1/2/2007" | 
                 Fulldata$Date == "2/2/2007")

##Convert the Global_active_power, each Sub_metering variable, Voltage, and 
##Global_reactive_power to a quantitative variable
##Make a new Date-time variable/class from existing date and time variables
data$Global_active_power <- 
  as.numeric(levels(data$Global_active_power))[data$Global_active_power]
data$Sub_metering_1 <- 
  as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
data$Sub_metering_2 <- 
  as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]
data$Voltage <- as.numeric(levels(data$Voltage))[data$Voltage]
data$Global_reactive_power <- 
  as.numeric(levels(data$Global_reactive_power))[data$Global_reactive_power]
data$DateTime <- paste(as.character(data$Date),as.character(data$Time))
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

 
png(file = "plot4.png") #Initiate PNG device for plots 
par(mfcol=c(2,2)) #Contruct 2x2 space for the four plots

##Generate the time series subplot for Global active power
plot(data$DateTime,data$Global_active_power,type="n",
     ylab="Global Active Power (kilowatts)",xlab="")
lines(data$DateTime,data$Global_active_power)

##Generate the time series subplot for each (3) sub metering variable
plot(data$DateTime,data$Sub_metering_1,type="n",
     ylab="Energy sub metering",xlab="")
lines(data$DateTime,data$Sub_metering_1)
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright", legend = names(data[,7:9]),col=c("black","red","blue"),lwd=1,
       bty="n")

##Generate the time series subplot for Voltage
plot(data$DateTime,data$Voltage,type="n",ylab="Voltage",xlab="datetime")
lines(data$DateTime,data$Voltage)

##Generate the time series subplot for Global reactive power
plot(data$DateTime,data$Global_reactive_power,type="n",
     ylab="Global_reactive_power",xlab="datetime")
lines(data$DateTime,data$Global_reactive_power)

dev.off()  ##Don't forget this step - to close open graphics windows
