#!/bin/sh  
#  
# Read Battery Voltage on ODROID-C0  
#  
  
ADCRES=0.004106  
ADCVAL=$(cat /sys/class/saradc/saradc_ch0)  
BATTVOL=$(echo $ADCRES*$ADCVAL | bc)  
echo Battery voltage is $BATTVOL V
