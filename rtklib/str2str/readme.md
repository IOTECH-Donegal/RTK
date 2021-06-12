# str2str readme

A running and tested version of str2str, compiled on RPi.
There are many command line options and the examples available on line are a bit thin!

autoexec.sh
1. Example code for RPi Zero, acting an an NTRIP client to RTK2GO and forwarding RTCM3 to the serial port. 
2. Be warned, the GPIO serial is 3v3 only, you can connect this to a PRi or an Ardusimple, but its not RS232 levels.
3. This connects to UART1 on a Ardusimple configured as a Rover.
