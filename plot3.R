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
png(filename = "plot3.png", width=480, height=480, units="px")

plot(x = seq_along(powerConsumption$DateTime),
     y = powerConsumption$Sub_metering_1, 
     main="", xlab="", ylab="Energy sub metering",
     type='n', xaxt="n")
legend("topright", lty = 1,
       legend = paste0("Sub_metering_",1:3), 
       col = c("black","red","blue"))
axis(side=1, at=labLoc, labels = labText)
lines(x = seq_along(powerConsumption$DateTime),
      y = powerConsumption$Sub_metering_1, col="black")
lines(x = seq_along(powerConsumption$DateTime),
      y = powerConsumption$Sub_metering_2, col="red")
lines(x = seq_along(powerConsumption$DateTime),
      y = powerConsumption$Sub_metering_3, col="blue")

dev.off()
