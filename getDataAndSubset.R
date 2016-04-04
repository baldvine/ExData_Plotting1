
# setwd("./Coursera/Exploratory/Week1/ExData_Plotting1/")

zipFileLoc <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFileName <- "household_power_consumption.zip"
# Download if necessary:
if (!file.exists(zipFileName)){
  download.file(url=zipFileLoc, 
                destfile = zipFileName, 
                method='curl')
}
# Unzip if necessary:
zippedFileName <- "household_power_consumption.txt"
if (!file.exists(zippedFileName)){
  unzip(zipfile = zipFileName)
}

# Read into R. This really takes only 5 seconds:
powerConsumption <- read.table(zippedFileName, header=TRUE, 
                               stringsAsFactors = FALSE, 
                               sep=";", na.strings = "?")

# Subset to February 1 and 2 of 2007
powerConsumption <- subset(powerConsumption, 
                           Date %in% c("1/2/2007", "2/2/2007"))

# Add full time stamp:
powerConsumption$DateTime <- 
  strptime(x = paste(powerConsumption$Date,
                    powerConsumption$Time), 
          format = "%d/%m/%Y %H:%M:%S")

# Clean up environment:
rm(list=c("zipFileLoc", "zipFileName", "zippedFileName"))