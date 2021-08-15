#####################################################################
# Filename      : plot4.R                                           #
# Author        : Robert Muwanga                                    #
# Purpose       : Script for generating 'plot4.png'                 #
# Dependencies  : setup.R - script for loading datasets into        #
#                 environment                                       #
#                 plot2.R - for plotting plot2                      #
#                 plot3.R - for plotting plot3                      #
# Last Updated  : 15 August 2021                                    #
#####################################################################

# Require plot2 and plot3 as part of generating png graphic.
source('plot2.R')
source('plot3.R')

if(!('data' %in% ls())) { # Load the dataset if it doesn't exist in environment
  source('setup.R')
}

#Plot4 - 2x2 image
plot4 <- function(x) {
  par(mfcol = c(2,2))
  plot2()
  plot3()
  
  plot(x = data$FullDateTime, 
       y = data$Voltage, 
       type = 'l',
       xlab = 'datetime',
       ylab = 'Voltage')
  
  plot(x = data$FullDateTime, 
       y = data$Global_reactive_power, 
       type = 'l',
       xlab = 'datetime',
       ylab = 'Global_reactive_power')
  
}

# Save plot as png
png('plot4.png')
plot4()
dev.off()