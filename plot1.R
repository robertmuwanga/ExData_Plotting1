#####################################################################
# Filename      : plot1.R                                           #
# Author        : Robert Muwanga                                    #
# Purpose       : Script for generating 'plot1.png'                 #
# Dependencies  : setup.R - script for loading datasets into        #
#                 environment                                       #
# Last Updated  : 15 August 2021                                    #
#####################################################################

if(!('data' %in% ls())) { # Load the dataset if it doesn't exist in environment
  source('setup.R')
}

# Plot 1 - Global Active Power
plot1 <- function() { 
  hist(data$Global_active_power, 
       col= 'red', 
       main = 'Global Active Power', 
       xlab = 'Global Active Power (kilowatts)')
  
}

# Save plot as png
png('plot1.png')
plot1()
dev.off()
