Alimentation batterie Lipo
==========================

 

La batterie est fournie pleine ?

 

Script : Auto shutdown
----------------------

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#!/bin/sh
MODEL=$(cat /proc/cpuinfo | grep ^Hardware | awk -F " " '{print $3}')
SYSFS_GPIO_DIR="/sys/class/gpio"

retval=""

gpio_export()
{
        [ -e "$SYSFS_GPIO_DIR/gpio$1" ] && return 0
        echo $1 > "$SYSFS_GPIO_DIR/export"
}

gpio_getvalue()
{
    echo in > "$SYSFS_GPIO_DIR/gpio$1/direction"
        val=`cat "$SYSFS_GPIO_DIR/gpio$1/value"`
        retval=$val
}

gpio_setvalue()
{
    echo out > "$SYSFS_GPIO_DIR/gpio$1/direction"
        echo $2 > "$SYSFS_GPIO_DIR/gpio$1/value"
}

if test $MODEL = "ODROIDC"
then
        AC_OK_GPIO=88
        BAT_OK_GPIO=116
    LATCH_GPIO=115
    gpio_export $LATCH_GPIO 
    gpio_setvalue $LATCH_GPIO 1
elif test $MODEL = "ODROID-C2"
then
        AC_OK_GPIO=247
        BAT_OK_GPIO=239
    LATCH_GPIO=225
    gpio_export $LATCH_GPIO 
    gpio_setvalue $LATCH_GPIO 1
else 
        AC_OK_GPIO=199
        BAT_OK_GPIO=200
fi

gpio_export $AC_OK_GPIO
gpio_export $BAT_OK_GPIO
gpio_getvalue $AC_OK_GPIO
if [ $retval -eq  1 ]
then
        echo "DC Input Okay"
else
        echo "Power is shutdown or AC Adaptor is disconnected"
        gpio_getvalue $BAT_OK_GPIO
        echo $retval
        if [ $retval -eq 0 ]
        then
                echo "battery is lower than 3.7V"
                /sbin/shutdown -P 1
        else
                echo "battery is good"
        fi
fi
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

### Cron setup

This can be set up by running: **\$ sudo crontab -e**

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# m h  dom mon dow   command
*/2 * * * * /home/odroid/ups3.sh
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The script will run every 2 minutes.

 

Script : niveau batterie
------------------------

### Read Battery Voltage Script on ODROID-C0

This script read the voltage of battery from ADC channel 0.  
Save the following code as readbatvol.sh in home directory.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#!/bin/sh
#
# Read Battery Voltage on ODROID-C0
#

ADCRES=0.004106
ADCVAL=$(cat /sys/class/saradc/saradc_ch0)
BATTVOL=$(echo $ADCRES*$ADCVAL | bc)
echo Battery voltage is $BATTVOL V
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Please change the script permissions to execute with chmod.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sudo chmod a+x readbatvol.sh
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Execute the script to read battery voltage.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./readbatvol.sh
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
