---
layout: post
title: "Swarm for privacy nerds"
description: "Not cleaning up your WiFi connection history could potentially harm your privacy"
tags: [privacy, security]
image:
  opacity: 0.9
  feature: posts/2018/google-earh-privacy.jpg
  alt: Street view road
credit:
  creditlink:
comments: true
share: true
---
Privacy is becoming one of the most discussed topics especially with the GDPR looking
around the corner this year.

During my work I'm doing at [Ambassify](https://www.ambassify.com) around setting up
a framework for handling information security and privacy I stumbled upon an
interesting privacy issue.

Your OS stores a list of previously connected WiFi hotspots on your computer for
convinience so you can auto reconnect when you visit the same location a second time.
The problem with this is that each WiFi hotspot name, also called the SSID, is potentially unique.

These semi unique SSIDs in combination with a wardrive database like [Wiggle](https://wigle.net/)
would make it possible for us to query each SSID in the computers hotspot history and
plot the resulting coordinates on a map to get an idea which locations a certain user
has visited.

## Proof of Concept
The following proof of concept is for Mac but I'm sure the same thing will be possible
on other OS'es

```sh
# get list of previously connected hotspots
ap=$(defaults read /Library/Preferences/SystemConfiguration/com.apple.airport.preferences | grep SSIDString | sed -E 's/SSIDString = ?(.*);/\1/' | xargs -n1 | sort -u)
echo $ap

for name in $ap; do

    # fetch hotspot info from Wigle API
    result=$(curl -s -H 'Accept:application/json' -u [credentials] --basic "https://api.wigle.net/api/v2/network/search?ssid="$name)

    # extract coordinates
    long=$(echo $result | python -c "import sys, json; print json.load(sys.stdin)['results'][0]['trilong']")
    lat=$(echo $result | python -c "import sys, json; print json.load(sys.stdin)['results'][0]['trilat']")
    echo "[$lat, $long, '$name'],"
done
```

When you drop the output that this script generates into [this Google Maps example
](https://jsfiddle.net/sitebase/cgxrtvcb/) you get a visual map of potential locations
I, or atleast my laptop, have been.


![Example wifi hotspot location plot](/images/posts/2018/google-map-plot-wifi-hotspots.jpg)

Note that this map above was only generated from a subset of my total history. My complete
history contained more than 350 access points.

## Conclusion
The point that I want to make with this PoC is: lookout what data you share.
It's not because certain data is not senitive at this moment that it can't be in a
few years or when combined with some other datasets.

