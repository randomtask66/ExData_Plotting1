library(XML)
library(dplyr)
if(!file.exists("./data")){dir.create("./data")}

data <- read.csv(file = "./data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                 nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')

png("plot1.png", width=480, height=480)
hist(as.numeric(data$Global_active_power) , col="red", xlab = "Global Active Power (kilowatts)",
     main="Global Active Power")

dev.off()