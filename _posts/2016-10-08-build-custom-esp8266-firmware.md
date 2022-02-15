---
layout: post
title: "Build custom NodeMCU firmware and flash it on ESP8266"
description: "Tutorial that explains how to build custom NodeMCU firmware using Docker and flash your ESP8266 using an FTDI"
modified: 2016-10-08 09:35:17 +0100
tags: [iot, electronics, howto]
image:
  opacity: 0.4
  feature: posts/2016/esp8266-01-firmware.jpg
  alt: ESP8266 on white paper
  credit:
  creditlink:
comments: true
share: true
---
In this quick reference I'll show you how to build the NodeMCU firmware from source and flash it on your [ESP8266](https://tidd.ly/3HTf1gX). In this case I used the [ESP8266-01](https://tidd.ly/3HTf1gX).

You can use these exact same steps to flash any version of ESP8266 but the way you will connect it to your FTDI will differ. A simple [Google images search](https://www.google.be/search?q=esp8266-12+ftdi&biw=888&bih=1103&source=lnms&tbm=isch&sa=X&ved=0ahUKEwir-uiy4MrPAhWnK8AKHSCWCdMQ_AUIBigB) will help you to find the connection schema for your ESP8266 version.

![How to connect ESP8266 01 wifi module to FTDI](/images/posts/2016/esp8266-01-ftdi-connection.png)

1. Clone the NodeMCU project `git clone https://github.com/nodemcu/nodemcu-firmware.git`. Or download it manually from [GitHub](https://github.com/nodemcu/nodemcu-firmware.git) if you're not a command line lover.
2. Open the `nodemcu-firmware` folder
3. To enable and/or disable modules and settings in the firmware you can open `/app/includes/user_config.h` and `/app/includes/user_modules.h` and comment/uncomment what you need
4. Run following [Docker](https://www.docker.com/) command ``sudo docker run --rm -ti -v `pwd`:/opt/nodemcu-firmware marcelstoer/nodemcu-build build``. I need to run this as super user otherwise I get an error about the docker daemon not running.
5. Wait for the command to finish and you'll find your custom build firmware in the `bin` folder
6. Install [esptool](https://github.com/themadinventor/esptool) using `pip install esptool` which we will use to flash the ESP8266
7. Connect your ESP8266 to your FTDI using the diagram above. Do make sure your **FTDI is 3.3v**. If you use a 5v one you'll toast your ESP. Trust me I've done this before. You can use a 5v FTDI but you'll have to use a separate 3.3v power supply to power your ESP8266.
8. Flash your ESP8266 using following command `esptool.py --port <USB-kport-with-ESP8266> write_flash 0x00000 <NodeMCU-firmware-directory>/bin/nodemcu_[integer|float]_<Git-branch>.bin`
9. You can use a tool like [ESPlorer](http://esp8266.ru/esplorer/) to see if your flashed ESP8266 is working.

![Pinout overview of the ESP8266 01 wifi module](/images/posts/2016/esp8266-01-pinout.png)

