---
layout: post
title: "Modify LOEWE sound subwoofer to be used standalone"
description: "Mod your LOEWE sound subwoofer so that it also can be used without a television"
tags: [repair, diy, electronics]
image:
  opacity: 0.9
  feature: posts/2021/loewe-subwoofer-mod.jpg
credit:
  creditlink:
comments: true
share: true
---
My brother asked to look at a LOEWE amp that he had lying around collecting dust. It turns out you need to connect a LOEWE television to these amps to get them out of some sleep mode.

After looking into some of the schematics, it turns out that you indeed need a 12v signal trigger (blue line) to turn the power supply on. The 12v will activate an [opto-isolator](https://en.wikipedia.org/wiki/Opto-isolator) `PC911` and wakes the subwoofer.

![LOEWE subwoofer schematics trigger standalone](/images/posts/2021/loewe-subwoofer-schematics.png)

This is another excellent piece of vendor lock-in. In my brother's case, the TV broke, so you are obligated to buy another LOEWE TV or face the fact that you're stuck with a costly brick of a few thousand euros.

Luckily there is a straightforward solution for this. If you search for a solution for this, you'll find many suggestions to just use a second power supply to put 12v directly on the trigger pin. The advantage of this is that you don't have to mess with opening the subwoofer. But, it's not the most elegant solution to this.

A better option would be to bridge the opto-isolator `PC911`, so it's always on. This way, you don't need the extra power supply, making it more power-efficient and less wiring to cover up.
You need to bridge the two pins on the side of the label (PC911). See my picture above to get a visual example of how I did this.

And if you combine this mod with something like a [Raspberry PI with PI Music box](https://www.sitebase.be/diy-remote-speaker-with-raspberry-pi/) you'll end up with a modern network-connected sound system.
