#####################################################################
# Filename      : setup.R                                           #
# Author        : Robert Muwanga                                    #
# Purpose       : Script for setting up project to generate plots   #
# Last Updated  : 15 August 2021                                    #
#####################################################################

libraries <- c('here')
options(scipen=999) # Remove scientific notation

# Install missing libraries and load libraries into user's environment.
sapply(libraries, function(x) { 
  if(!(x %in% installed.packages())) {
    install.packages(x)
  }
})

require(libraries, character.only = TRUE)

### Download and extract source data
compressed_filename <- 'household_power_consumption.zip'
uncompressed_filename <- 'household_power_consumption.txt'
uri <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

if(!exists(compressed_filename)) {
  download.file(uri, compressed_filename)
}

if(!exists(uncompressed_filename)){
  unzip(compressed_filename)
}

### Load data into data frame
column_classes <- c('character', 'character', rep('numeric', 7))
data <- read.delim(
  file = uncompressed_filename, 
  header= TRUE, 
  sep = ';', 
  na.strings = '?',
  colClasses = column_classes)

data$Date <- as.Date(data$Date, format='%d/%m/%Y')
data$Time <- format(strptime(data$Time, format = '%T'), '%T')
data$FullDateTime <- as.POSIXct(paste(data$Date, data$Time))

data <- subset(data, Date >= '2007-02-01' & Date <= '2007-02-02')