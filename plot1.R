data <- 
  read.csv("./household_power_consumption.txt", sep = ";",
           header = T, colClasses = c("character", "character", rep("numeric",7)),
           na.strings = "?"
           )

data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
data$DateTime <- as.POSIXlt(paste(data$Date, data$Time), 
                            format="%d/%m/%Y %H:%M:%S")
#plot1
hist(data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")


dev.copy(png, filename = "plot1.png", width = 480, height = 480)
dev.off()