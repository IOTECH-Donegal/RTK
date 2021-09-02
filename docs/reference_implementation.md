### Reference Implementations
So, how do we define the meaning of the expression _"it works!"_.

For any project we need a metre stick (the metric version of a yardstick!) which 
clarifies unambiguously, what _working_ means. In this case, I am standardizing on
unmodified OpenCPN running on a RPi 3B+.

So, the complications...

For precision work, UBX outputs DD.MMmmmmmmm where 
- DD = Degrees
- MM = Minutes
- mm = Minutes after the decimal point

Not every instrument will accept this.

First problem, some instruments don't like that many decimal places.
Second problem, some instruments (and KPLEX) don't like NMEA sentences above the maximum 82 characters.

I'm testing to OpenCPN only, if that works and I can log raw NMEA/UBX/RTCM/AIS, I'm happy!

### Port Allocations
Unless otherwise state:
USB is for control, configuration and monitoring only.
UART1 egresses NMEA and UBX for logging, instruments, etc.
UBlox recommend using UART2 for RTCM only, everything else is switched off. 

Remember, on an Ardusimple, UART2 is wired counter-intuitive, RX is transmit and TX is receive!


### Ardusimple configuration
I configure the following in U-Centre

- UBX-CFG-NMEA set NMEA version to 4.11 and enable high precision mode. You should have 7 digits after the decimal point on the NMEA output.

I configure the following in U-Centre to log the minimum data on UART1.

- UBX-PRT set UART1 protcol in to **none** and protocol out to **NMEA** 
- Set UBX-MSG-F0-00 NMEA GxGGA to **On** for UART2 for XYZ position data
- Set UBX-MSG-F0-01 NMEA GxGLL to **Off** for UART2
- Set UBX-MSG-F0-02 NMEA GxGSA to **Off** for UART2
- Set UBX-MSG-F0-03 NMEA GxGSV to **Off** for UART2
- Set UBX-MSG-F0-04 NMEA GxRMC to **On** for UART2 for COG and SOG data
- Set UBX-MSG-F0-05 NMEA GxVTG to **Off** for UART2
- Set UBX-MSG-F0-07 NMEA GxGST to **On** for UART2 for accuracy data
- Set UBX-MSG-F0-08 NMEA GxZDA to **On** for UART2 for date and time information

Also enable 2D and 3D accuary UBX sentences for U-Centre

- Set UBX-MSG 01-01 NAV-POSECEF to **On** for USB
- Set UBX-MSG 01-02 NAV-POSLLH to **On** for USB

Before you power down, save the configuration by going to UBX-CFG Save Current Configuration and press **send**

Always take a backup of the Ardusimple configuration at the end of a configuration session. 

In U-Centre, select **Tools**, **Receiver Configuration**, set a file name and then click **Transfer GNSS->File**


 
