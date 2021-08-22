#!/bin/bash
# by: JOR
# Date: 14MAY21
# Function: autoexec for Linux
# Leave this script in /home/pi
# Script: autoexec.sh

HOMEPATH="/home/pi"

# Configure hardware serial port
stty -F /dev/ttyS0 clocal raw speed 115200

# Get RTCM3 from RTK2GO and send to Ardusimple
$HOMEPATH/rtklib/str2str/str2str -in ntripcli://:@rtk2go.com/Umricam -out serial ://ttyS0:115200:8:n:1
