# This script loads the data and subsets.
# The dataset is in the object powerConsumption
source("getDataAndSubset.R")

# First, we find the indexes to place the tick marks:
labLoc <- match(c("2007-02-01 00:00:00",
                  "2007-02-02 00:00:00",
                  "2007-02-02 23:59:00"), 
                powerConsumption$DateTime)
labText <- c("Thu","Fri","Sat")

# Ok, we're ready for plotting:
png(filename = "plot4.png", width=480, height=480, units="px")
# Then set up some plot parameters:
par(mfrow=c(2,2))

# Plot 1 at (1,1):
plot(x = powerConsumption$Global_active_power,
     main="", xlab="", ylab="Global Active Power",
     type='n', xaxt="n")
axis(side=1, at=labLoc, labels = labText)
lines(x = powerConsumption$Global_active_power)

# Plot 2 at (1,2):
plot(x = powerConsumption$Voltage,
     main="", xlab="datetime", ylab="Voltage",
     type='n', xaxt="n")
axis(side=1, at=labLoc, labels = labText)
lines(x = powerConsumption$Voltage)

# Plot 3 at (2,1):
plot(x = seq_along(powerConsumption$DateTime),
     y = powerConsumption$Sub_metering_1, 
     main="", xlab="", ylab="Energy sub metering",
     type='n', xaxt="n")
legend("topright", lty = 1, bty = "n",
       legend = paste0("Sub_metering_",1:3), 
       col = c("black","red","blue"))
axis(side=1, at=labLoc, labels = labText)
lines(x = seq_along(powerConsumption$DateTime),
      y = powerConsumption$Sub_metering_1, col="black")
lines(x = seq_along(powerConsumption$DateTime),
      y = powerConsumption$Sub_metering_2, col="red")
lines(x = seq_along(powerConsumption$DateTime),
      y = powerConsumption$Sub_metering_3, col="blue")

# Plot 4 at (2,2):
plot(x = powerConsumption$Global_reactive_power,
     main="", xlab="datetime", ylab = "Global_reactive_power",
     type='n', xaxt="n")
axis(side=1, at=labLoc, labels = labText)
lines(x = powerConsumption$Global_reactive_power)

dev.off()