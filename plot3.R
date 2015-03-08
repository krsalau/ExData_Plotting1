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
#This code will generate a time series for each submetering variable
################################################################################

##Load in the data specific to the dates 2007/02/01 and 2007/02/02
Fulldata <- read.table("household_power_consumption.txt",sep = ";",header=TRUE)
data <- subset(Fulldata, Fulldata$Date == "1/2/2007" | 
                 Fulldata$Date == "2/2/2007")

##Convert the Sub_metering variable to a quantitative variable
##Make a new Date-time variable/class from existing date and time variables
data$Sub_metering_1 <- 
  as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
data$Sub_metering_2 <- 
  as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]
data$DateTime <- paste(as.character(data$Date),as.character(data$Time))
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

##Contruct a time series of the submetering variables and it to a PNG file 
png(file = "plot3.png")
plot(data$DateTime,data$Sub_metering_1,type="n",
     ylab="Energy sub metering",xlab="")
lines(data$DateTime,data$Sub_metering_1)
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright", legend = names(data[,7:9]),col=c("black","red","blue"),lwd=1)
dev.off()  ##Don't forget this step - to close open graphics windows
