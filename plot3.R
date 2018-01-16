data <- 
  read.csv("./household_power_consumption.txt", sep = ";",
           header = T, colClasses = c("character", "character", rep("numeric",7)),
           na.strings = "?"
  )

data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
data$DateTime <- as.POSIXlt(paste(data$Date, data$Time), 
                            format="%d/%m/%Y %H:%M:%S")

#plot3
plot( data[c(10, 7)], type = "l", ylab = "Energy sub metering", 
      xlab = "")
lines(data[c(10, 8)], col = "red")
lines(data[c(10, 9)], col = "blue")
legend("topright", lty  = 1 , 
       legend = colnames(data[7:9]), 
       col = c("black", "red", "blue"))

dev.copy(png, filename = "plot3.png", width = 480, height = 480)
dev.off()