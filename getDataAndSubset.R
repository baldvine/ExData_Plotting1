
# setwd("./Coursera/Exploratory/Week1/ExData_Plotting1/")

zipFileLoc <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFileName <- "household_power_consumption.zip"

if (!file.exists(zipFileName)){
  download.file(url=zipFileLoc, 
                destfile = zipFileName, 
                method='curl')
}

zippedFileName <- "household_power_consumption.txt"
if (!file.exists(zippedFileName)){
  unzip(zipfile = zipFileName)
}

# This really takes only 5 seconds:
powerConsumption <- read.table(zippedFileName, header=TRUE, 
                               stringsAsFactors = FALSE, 
                               sep=";", na.strings = "?")

# Subset to February 1 and 2 of 2007
powerConsumption <- subset(powerConsumption, 
                           Date %in% c("1/2/2007", "2/2/2007"))

rm(list=c("zipFileLoc", "zipFileName", "zippedFileName"))
