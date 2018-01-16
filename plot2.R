data <- 
  read.csv("./household_power_consumption.txt", sep = ";",
           header = T, colClasses = c("character", "character", rep("numeric",7)),
           na.strings = "?"
  )

data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
data$DateTime <- as.POSIXlt(paste(data$Date, data$Time), 
                            format="%d/%m/%Y %H:%M:%S")

#plot2
plot( data[c(10, 3)], type = "l", ylab = "Global Active Power (kilowatts)", 
      xlab = "")

dev.copy(png, filename = "plot2.png", width = 480, height = 480)
dev.off()