# Recipe 2: Using RTKLIB for RTK processing

You may be able to generate RTK solutions using cheaper, older (non-RTK) chipsets, if your GPS outputs RAW data, rather than just NMEA.
Download RTKLIB from https://rtkexplorer.com/
My own preference for development is Linux/RPi, but this works on Windows clients also.

Using UBlox U-Center software, enable:
RXM-RAWX
RXM-SFRBX

This will allow you to log the raw measurements in a proprietary UBX format.
Use the tool RTKNAVI and connect the GPS as the rover.
Connect the base station to the CORS source.
After a few minutes, you should get an RTK solution.
