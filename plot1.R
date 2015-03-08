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
#This code will generate a histogram illustrating the frequency of Global active
#power values over the first two days in February 2007
################################################################################

##Load in the data specific to the dates 2007/02/01 and 2007/02/02
Fulldata <- read.table("household_power_consumption.txt",sep = ";",header=TRUE)
data <- subset(Fulldata, Fulldata$Date == "1/2/2007" | 
                 Fulldata$Date == "2/2/2007")

##Convert the Global active power variable to a quantitative variable
data$Global_active_power <- 
  as.numeric(levels(data$Global_active_power))[data$Global_active_power]

##Contruct a histogram of Global Active Power 
png(file="plot1.png")
hist(data$Global_active_power,main="Global Active Power",col="red",
     xlab="Global Active Power (kilowatts)", ylim = c(0,1200))
dev.off()  ##Don't forget this step - to close open graphics windows