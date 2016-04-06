# This script loads the data and subsets.
# The dataset is in the object powerConsumption
source("getDataAndSubset.R")

# # First, we find the indexes to place the tick marks:
# labLoc <- match(c("2007-02-01 00:00:00",
#                   "2007-02-02 00:00:00",
#                   "2007-02-02 23:59:00"), 
#                 powerConsumption$DateTime)
# labText <- c("Thu","Fri","Sat")
# # Actually, this is not necessary

# Ok, we're ready for plotting:
png(filename = "plot2.png", width=480, height=480, units="px")
# Note that we simply use the indices as the x-axis:
plot(x = powerConsumption$DateTime,
     y = powerConsumption$Global_active_power,
     main="", xlab="", ylab="Global Active Power (kilowatts)",
     type='l')
#axis(side=1, at=labLoc, labels = labText)
#lines(x = powerConsumption$Global_active_power)

dev.off()
