#####################################################################
# Filename      : plot2.R                                           #
# Author        : Robert Muwanga                                    #
# Purpose       : Script for generating 'plot2.png'                 #
# Dependencies  : setup.R - script for loading datasets into        #
#                 environment                                       #
# Last Updated  : 15 August 2021                                    #
#####################################################################

if(!('data' %in% ls())) { # Load the dataset if it doesn't exist in environment
  source('setup.R')
}

# Plot 2 - Global Active Power (kw) against Days
plot2 <- function() { 
  plot(x = data$FullDateTime, 
       y = data$Global_active_power, 
       type = 'l',
       xlab = '',
       ylab = 'Global Active Power (kilowatts)')
}

# Save plot as png
png('plot2.png')
plot2()
dev.off()
