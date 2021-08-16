# Recipe 3: Accurately survey the base location using RINEX files

I use a dedicated Windows 7 computer to manage my _Continuously Operating Reference Station_ (CORS).
I have installed RTKLIB from http://rtkexplorer.com/downloads/rtklib-code/ or you can use the Linux version at the command line.

1. Fix the base antenna in a permanent location. My CORS station uses a steel pole with a survey grade antenna.
2. Set the base to save raw GNSS data. This will work with UBlox-F9P, but may not work with earlier versions. Enable: 
- Raw data by right-clicking **UBX-RXM-RAWX** in U-Centre and enabling.
- Subframe information by right-clicking **UBX-RXM-SFRBX** in U-Centre and enabling.

In U-Centre, go to **Player->Record**. I record 24 hours of data, so I have a good sample size.
In Base/Rover terms, this is the Rover data.
Next I need to find an official source of RINEX data. In the UK and ireland, this data can be got from OS/OSI.
For my location, I can get data from two stations, Malin and Foyle, at https://gnss.osi.ie/download-rinex.php
I select the station, date, start and end time.
Note that the data is not available until c. 2 hours after it is logged, and sometimes stations are broken, no data!






  
