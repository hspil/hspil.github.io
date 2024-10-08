# 630m Monitoring Station (Linux)

## Overview
There are a number of closely related weak signal digital modes commonly used on the 630m and 2200m ham bands. WSPR is the most common, and works just like on higher bands. FST4 and FST4W, which were specifically designed for the low bands, are also common. FST4 is a QSO mode similar to FT8, and FST4W is a WSPRlike beaconing mode. Both can be run at a variety of cycle lengths. Abbreviated mode names including the cycle lengths are commonly used; e.g. F2 for 120 second (2 minute) FST4, FW5 for 300 second FST4W.

All these modes are transmitted somewhere in the ~3kHz above 474.2 kHz, so I've set up a receiving station to constantly (mostly) listen and decode all these modes.

## Antenna and Receiver Setup

The following graciously given to me by my elmer Laurence, KL7L:
* SDRPlay RSPduo SDR Receiver
* Isolation transformer
* Bias tee power injector
* Active E-field probe antenna

The most difficult problem is keeping rf noise from the computer, receiver, and associated $&!#^%&^ switch mode power supplies from travelling up the shield of the coäx to the antenna. I found that it was vital to provide the shield of the coäx a good rf connection to ground. There was an existing RG-6 passthrough in the wall of my room that was formerly used for satellite TV which I am reusing. Outside I have a female to female F connector block with a grounding lug that is connected to a water spigot. The E-field probe is mounted about 10' up on a piece of PVC pipe.


## Software Setup
[Here](https://www.kylxbn.com/articles/sdrplay-rsp1a-on-linux/) is an excellent guide for getting SDRPlay drivers set up.  

I'm using [GQRX](https://www.gqrx.dk/) to decode upper sideband from the SDR. I set up an audio loopback for the audio output from GQRX. One way to do this is to load a PulseAudio null-sink module. WSJTX will be set up to listen from the null-sink monitor input device.  

The following monstrosity, exempli gratia, launches a large number of instances of WSJTX that all can run simultaneously with different default configurations:  
`wsjtx --rig-name=wspr & wsjtx --rig-name=f1 & wsjtx --rig-name=f2 & wsjtx --rig-name=f5 & wsjtx --rig-name=f15 & wsjtx --rig-name=f30 & wsjtx --rig-name=fw2 & wsjtx --rig-name=fw5 & wsjtx --rig-name=fw15 & wsjtx --rig-name=fw30 &`  
Setting up all of these is a slightly long and repetitive process, but it only needs to be done once.  

For each, set:
* Callsign
* Grid squrare
* Audio input device
* PSK Reporter/WSPRnet spotting
* Mode and cycle length

## Results
I have been successful in decoding frames from stations across the continental US, a few in Canada, and one in the Cayman Islands. On one evening with particularly good propagation conditions, I decoded KL7L from Alaska on FW5.
