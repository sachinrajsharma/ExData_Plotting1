
library(tidyr)
library(tidyverse)
library(lubridate)
library(dplyr)

household <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)


view(household)

#Read 2890 rows that contain information on 2007-02-01 and 2007-02-02

household_new <-read.table("household_power_consumption.txt", header=TRUE,sep=";", skip=66636, 
                           nrows=2890, col.names=names(household), na.strings=c("?"),
                           colClasses=c("character", "character","numeric","numeric","numeric","numeric",
                                        "numeric","numeric","numeric"))






# Filtering out the final rows which are  required : 

household_new <- household_new[1:2880,] 


view(household_new)

#Converting Date and Time variables to Date/Time format

household_new$Date<-as.Date(household_new$Date, format = "%d/%m/%Y")
household_new$Time<-strptime(household_new$Time,format = "%H:%M:%S")



# Plot 4.: We will plot combination of 4 plots as per the requirement : global active power, energy sub meterings, voltage over time, global reactive power over time

par(mfcol=c(2,2), mar=c(4.5,5,2,2))
# Plot 4 (a)
plot(household_new$Time,household_new$Global_active_power, ylab="Global Active Power (kilowatts)", 
     xlab="", pch =".", type="l")
# Plot 4(b)
plot(household_new$Time,household_new$Sub_metering_1,ylab="Energy sub metering", xlab="", type="l", col="black")
points(household_new$Time,household_new$Sub_metering_2, col="red", type="l")
points(household_new$Time,household_new$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=names(household_new[,7:9]), bty="n")
# Plot 4(c)
plot(household_new$Time,household_new$Voltage, ylab="Voltage", xlab="datetime", type="l")
# Plot 4(d)
plot(household_new$Time,household_new$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")



# Saving the plots in png file 


png("plot4.png", width=480, height=480)
par(mfcol=c(2,2), mar=c(4.5,5,2,2))
# Plot 4 (a)
plot(household_new$Time,household_new$Global_active_power, ylab="Global Active Power (kilowatts)", 
     xlab="", pch =".", type="l")
# Plot 4(b)
plot(household_new$Time,household_new$Sub_metering_1,ylab="Energy sub metering", xlab="", type="l", col="black")
points(household_new$Time,household_new$Sub_metering_2, col="red", type="l")
points(household_new$Time,household_new$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=names(household_new[,7:9]), bty="n")
# Plot 4(c)
plot(household_new$Time,household_new$Voltage, ylab="Voltage", xlab="datetime", type="l")
# Plot 4(d)
plot(household_new$Time,household_new$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")
dev.off()
