# 630m Monitoring Station (Linux)

## Overview
There are a number of closely related weak signal digital modes commonly used on the 630m and 2200m ham bands. WSPR is the most common, and works just like on higher bands. FST4 and FST4W, which were specifically designed for the low bands, are also common. FST4 is a QSO mode similar to FT8, and FST4W is a WSPRlike beaconing mode. Both can be run at a variety of cycle lengths. Abbreviated mode names including the cycle lengths are commonly used; e.g. F2 for 120 second (2 minute) FST4, FW5 for 300 second FST4W.

All these modes are transmitted somewhere in the ~3k above 474.2 kHz. So I've set up a receiving station to constantly (mostly) listen and decode all these modes.

## Antenna and Receiver Setup

I'll write this up later.

## Software Setup
[Here](https://www.kylxbn.com/articles/sdrplay-rsp1a-on-linux/) is an excellent guide for getting SDRPlay drivers set up.

I'm using [GQRX](https://www.gqrx.dk/) to decode upper sideband from the SDR. I set up a loopback audio device for the audio output from GQRX. One way to do this is to load a PulseAudio null-sink module. WSJTX will be set up to listen from the null-sink monitor input device.

The following monstrosity launches a large number of copies of WSJTX that all can have different default configurations:  
`wsjtx --rig-name=wspr & wsjtx --rig-name=f1 & wsjtx --rig-name=f2 & wsjtx --rig-name=f5 & wsjtx --rig-name=f15 & wsjtx --rig-name=f30 & wsjtx --rig-name=fw2 & wsjtx --rig-name=fw5 & wsjtx --rig-name=fw15 & wsjtx --rig-name=fw30 &`  
Setting up all of these is a slightly long and repetitive process, but it only needs to be done once.  

For each, set:
* Callsign
* Grid squrare
* Audio input device
* PSK Reporter/WSPRnet spotting
* Mode and cycle length 
