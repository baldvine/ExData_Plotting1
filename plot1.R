# This script loads the data and subsets.
# The dataset is in the object powerConsumption
source("getDataAndSubset.R")

png(filename = "plot1.png", width=480, height=480, units="px")
hist(x = powerConsumption$Global_active_power, col = "red",
     main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()