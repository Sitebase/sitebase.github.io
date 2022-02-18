---
layout: post
title: "DIY remote speaker using Raspberry Pi"
description: "Converting my old surround receiver system in a Sonos-like remote speaker using Raspberry Pi and Pi MusicBox."
modified: 2016-05-17 20:08:48 +0200
tags: [audio, electronics, diy, raspberry pi]
image:
  feature: posts/2016/home-made-remote-speaker-raspberrypi.jpg
  alt: Raspberry Pi build into amp
  opacity: 0.8
  credit:
  creditlink:
comments:
share:
---
Because I spend a lot of time in my hobby room/man cave in progress, I was looking for an audio system. The two requirements were that it had to support AirPlay and needed to be cheap. Luckily I had this 10 year old Samsung surround receiver laying around, so that would be a perfect base for my audio system. This in combination with a new [Raspberry Pi](https://tidd.ly/3oON0zF) would be all the hardware needed to make this awesome sound system.


![Raspberry Pi spacer](/images/posts/2016/home-made-remote-speaker-receiver.jpg)

## In search for an OS
So now that I have my hardware selected it was time to search a good OS to run on the [Raspberry Pi](https://tidd.ly/3oON0zF). After some searching and comparing I found [Pi MusicBox](http://www.pimusicbox.com/) which supports AirPlay and a bunch of other cool stuff.

![MusicBox for Raspberry Pi](/images/posts/2016/home-made-remote-speaker-musicbox.jpg)

## Mount Raspberry Pi
The next challenge was finding a way to mount the [Raspberry Pi](https://tidd.ly/3oON0zF) inside the receiver case without getting a short circuit with the metal casing of the receiver.
When searching through my giant pile of Deal Extreme stuff I found these [nylon spacers](https://s.click.aliexpress.com/e/_Abr9J5) which would be perfect for this.

![Raspberry Pi spacer](/images/posts/2016/home-made-remote-speaker-spacer.jpg)

## Give me some power
My idea was instead of hooking up a regular power supply to the [Raspberry Pi](https://tidd.ly/3oON0zF), to use one of the internal power sources of the receiver.

So after some trial and error testing with my multimeter I found this wireless speaker slot that was delivering the correct amount of power. So I pulled out the expansion board and modified it with a fuse and connector so it was easier to connect the [Raspberry Pi](https://tidd.ly/3oON0zF).

![Wifi slot as power supply](/images/posts/2016/home-made-remote-speaker-wifi-slot.jpg)

![Wifi slot as power supply](/images/posts/2016/home-made-remote-speaker-wifi-mod1.jpg)

![Wifi slot as power supply](/images/posts/2016/home-made-remote-speaker-wifi-mod2.jpg)

So after this awesome modification, I plugged it in, put on the power of the receiver and got disappointed because an error message popped up saying that there was a problem with the system. Pulled out the expansion board again and luckily the receive was functioning again like it should.

So probably I had destroyed the PCB while drilling the holes for the connector and the fuse holder. Back to the drawing board.

Luckily the receiver did also have a USB port which also works at 5v, perfect!

By modifying the part that plugged in the PCB of the USB port with a female header, I was able to provide the [Raspberry Pi](https://tidd.ly/3oON0zF) directly with power through pins 2 (5v) and 6 (ground).

![Raspberry Pi spacer](/images/posts/2016/home-made-remote-speaker-power2.jpg)

![Raspberry Pi spacer](/images/posts/2016/home-made-remote-speaker-power3.jpg)

![Raspberry Pi spacer](/images/posts/2016/home-made-remote-speaker-power1.jpg)

## Result
I've added the receiver to my server rack using an old DVR rack shell as shelf. After using this system for over 3 months I'm really happy with the result.

![Raspberry Pi spacer](/images/posts/2016/home-made-remote-speaker-rack.jpg)

<iframe width="560" height="315" src="https://www.youtube.com/embed/eB6cBrg0Z5A" frameborder="0" allowfullscreen></iframe>

## Read only file system preferred
One potential problem that I can see happening is the SD card to go corrupt. Because the [Raspberry Pi](https://tidd.ly/3oON0zF) is turned off using the receiver power button, the [Raspberry Pi](https://tidd.ly/3oON0zF) isn't shutdown gracefully. The power is just cut, so if the [Raspberry Pi](https://tidd.ly/3oON0zF) is writing to the storage device at that moment, it can cause some problems.

