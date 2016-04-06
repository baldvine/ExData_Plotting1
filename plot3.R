# This script loads the data and subsets.
# The dataset is in the object powerConsumption
source("getDataAndSubset.R")

# Ok, we're ready for plotting:
png(filename = "plot3.png", width=480, height=480, units="px")

plot(x = powerConsumption$DateTime,
     y = powerConsumption$Sub_metering_1, 
     main="", xlab="", ylab="Energy sub metering",
     type='n') #, xaxt="n")
legend("topright", lty = 1,
       legend = paste0("Sub_metering_",1:3), 
       col = c("black","red","blue"))
#axis(side=1, at=labLoc, labels = labText)  # Use with xaxt="n" in plot()
lines(x = powerConsumption$DateTime,
      y = powerConsumption$Sub_metering_1, col="black")
lines(x = powerConsumption$DateTime,
      y = powerConsumption$Sub_metering_2, col="red")
lines(x = powerConsumption$DateTime,
      y = powerConsumption$Sub_metering_3, col="blue")

dev.off()
