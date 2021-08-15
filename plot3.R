#####################################################################
# Filename      : plot3.R                                           #
# Author        : Robert Muwanga                                    #
# Purpose       : Script for generating 'plot3.png'                 #
# Dependencies  : setup.R - script for loading datasets into        #
#                 environment                                       #
# Last Updated  : 15 August 2021                                    #
#####################################################################

if(!('data' %in% ls())) { # Load the dataset if it doesn't exist in environment
  source('setup.R')
}

#Plot 3 - Sub_metering plot

plot3 <- function() { 
  plot(x = data$FullDateTime, 
       y = data$Sub_metering_1, 
       type = 'n',
       xlab = '',
       ylab = 'Energy sub metering')
  lines(y = data$Sub_metering_1, x = data$FullDateTime, col = 'black')
  lines(y = data$Sub_metering_2, x = data$FullDateTime, col = 'red')
  lines(y = data$Sub_metering_3, x = data$FullDateTime, col = 'blue')
  legend('topright', lty = 1,
         col = c('black', 'red', 'blue'), 
         legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
}

# Save plot as png
png('plot3.png')
plot3()
dev.off()
