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

 
