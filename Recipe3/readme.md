# Recipe 3: Accurately survey the base location using RINEX files

I use a dedicated Windows 7 computer to manage my _Continuously Operating Reference Station_ (CORS).
I have installed RTKLIB from http://rtkexplorer.com/downloads/rtklib-code/ or you can use the Linux version at the command line.

1. Fix the base antenna in a permanent location. My CORS station uses a steel pole with a survey grade antenna.
2. Set the base to save raw GNSS data. This will work with UBlox-F9P, but may not work with earlier versions. Enable: 
- Raw data by right-clicking **UBX-RXM-RAWX** in U-Centre and enabling.
- Subframe information by right-clicking **UBX-RXM-SFRBX** in U-Centre and enabling.

In U-Centre, go to **Player->Record**. I record 24 hours of data, so I have a good sample size. I use the time as filename and the .ubx extension.

In Base/Rover terms, this is the Rover data.
Next I need to find an official source of RINEX data. In the UK and ireland, this data can be got from OS/OSI.
For my location, I can get data from two stations, Malin and Foyle, at https://gnss.osi.ie/download-rinex.php
I select the station, date, start and end time.
The data downloads as a ZIP file and when I extract the files, I have three files per hour.
Save these in a folder, mine is called **Malin RINEX**.
Note that the data is not available until c. 2 hours after it is logged, and sometimes stations are broken, no data!

1. Run the **RTKLaunch** tool.
2. Run the **RTKCONV** tool.
- As an input file, select your 24-hour log file. Mine was called **1049.ubx**.
- The tool will suggest file names for **OBS**, **NAV** and **SBS** files. 
- Click Convert and go for coffee.
- Save these file in a directory called **Rover RINEX**.

![](RTKCONV.jpg)

Now I can post-process my data.
3. Run the **RTKPOST** tool.
- The RINEX OBS data is the .o file from the **Rover RINEX** directory.
- The RINEX NAV data is the .n file from the **Rover RINEX** directory.
- Because there are many files, I can use the **?** symbol as a wildcard.
- Click Convert and go for dinner!

![](RTKPOST.jpg)

I copy the output to a directory called **Solution**. 
There are three files, I load the one without an extension into Excel.
There is a header, and then I get columns of data.
Any row with a **Q** value of **1** is in RTK Fixed mode and should be accurate. I ignore rows with any other Q value.

![](Output.jpg)

I can now do calculations, see how stable the position is, get the mean values, variance etc.

When all of this is finished, you have a CORS, but only on your home network. 
You could port-forward to an Internet connection.
As an alternative, I set up a Windows Server instance in Azure called NTRIP1.
I added 2101 as an inbound port, both in Azure and in the Windows Firewall.

I installed the free version of SNIP.
- I set Casters and Clients, Caster IP to 10.0.0.4 (the private address of NTRIP1)
- I set the IP Mapping to the public address, 20.123.13.249. 
- I tested this by opening a web browser to 20.123.13.249:2101

I then sent a stream to the server as a pushed-in stream, from str2str.
There is one "gotcha", the free version of SNIP will only support a single pushed-in stream.

There are two sample configuration files from Ardusimple ZED-F9P in this directory


















  
