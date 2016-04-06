# This script loads the data and subsets.
# The dataset is in the object powerConsumption
source("getDataAndSubset.R")

# Ok, we're ready for plotting:
png(filename = "plot4.png", width=480, height=480, units="px")
# Then set up some plot parameters:
par(mfrow=c(2,2))

# Plot 1 at (1,1):
plot(x = powerConsumption$DateTime,
     y = powerConsumption$Global_active_power,
     main="", xlab="", ylab="Global Active Power",
     type='l')

# Plot 2 at (1,2):
plot(x = powerConsumption$DateTime,
     y = powerConsumption$Voltage,
     main="", xlab="datetime", ylab="Voltage",
     type='l')

# Plot 3 at (2,1):
# First line:
plot(x = powerConsumption$DateTime,
     y = powerConsumption$Sub_metering_1, 
     main="", xlab="", ylab="Energy sub metering",
     type='l', col="black")
# lines(x = powerConsumption$DateTime,
#       y = powerConsumption$Sub_metering_1, col="black")
lines(x = powerConsumption$DateTime,
      y = powerConsumption$Sub_metering_2, col="red")
lines(x = powerConsumption$DateTime,
      y = powerConsumption$Sub_metering_3, col="blue")
legend("topright", lty = 1, bty = "n",
       legend = paste0("Sub_metering_",1:3), 
       col = c("black","red","blue"))

# Plot 4 at (2,2):
plot(x = powerConsumption$DateTime,
     y = powerConsumption$Global_reactive_power,
     main="", xlab="datetime", ylab = "Global_reactive_power",
     type='l')

dev.off()