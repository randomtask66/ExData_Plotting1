library(XML)
library(dplyr)
if(!file.exists("./data")){dir.create("./data")}

data <- read.csv(file = "./data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                 nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')


subset_data <- subset(data, subset = (Date %in% c("1/2/2007","2/2/2007")))

subset_data$datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480)
plot(subset_data$datetime, subset_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subset_data$datetime, subset_data$Sub_metering_2, type="l", col="red")
lines(subset_data$datetime, subset_data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()