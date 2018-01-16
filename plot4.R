data <- 
  read.csv("./household_power_consumption.txt", sep = ";",
           header = T, colClasses = c("character", "character", rep("numeric",7)),
           na.strings = "?"
  )

data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
data$DateTime <- as.POSIXlt(paste(data$Date, data$Time), 
                            format="%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2), mar = c(4,4,2,2), 
    mgp = c(2,1,0), 
    oma = c(0 , 0, 0, 0 ))

plot( data[c(10, 3)], type = "l", ylab = "Global Active Power", 
      xlab = "")

plot( data[c(10, 5)], type = "l")

plot( data[c(10, 7)], type = "l", ylab = "Energy sub metering", 
      xlab = "")
lines(data[c(10, 8)], col = "red")
lines(data[c(10, 9)], col = "blue")
legend("topright",  lty  = 1 , 
       legend = colnames(data[7:9]), 
       col = c("black", "red", "blue"), 
       bty = "n",
       cex = 0.8, 
       y.intersp = 0.4, adj = 0.1
       )

plot( data[c(10, 4)], type = "l")

dev.copy(png, filename = "plot4.png", width = 480, height = 480)
dev.off()