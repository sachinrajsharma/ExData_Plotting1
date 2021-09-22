
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



view(household_new)


# Plot 1. Histogram of Global active power consumption
par(mfrow=c(1,1),mar=c(5,4.5,4,2))
hist(household_new$Global_active_power, col="blue", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# Saving the plot in png format 

png("plot1.png", width=480, height=480)
par(mfrow=c(1,1),mar=c(5,4.5,4,2))
hist(household_new$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()


