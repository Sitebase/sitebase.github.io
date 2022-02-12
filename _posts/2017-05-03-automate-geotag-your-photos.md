---
layout: post
title: "How to geotag your photos in an automated way"
description: "How to geo tag your DSLR raw photos using iPhone as log tracker and exiftool. Exiftool will use a GPX log file to set the GPS location on your raw photos."
tags: [tip, photo, photography, workflow]
image:
  opacity: 0.9
  feature: posts/2017/geotag-photo-lightroom-map.jpg
  alt: Satelite view with GEO tags
  credit:
  creditlink:
comments: true
share: true
---
For a long time I've been looking for a good way to geotag my photos.
Preferably this workflow would work well with [my current photo workflow](/my-photo-management-workflow/).

I was already playing around with the ViewRanger app (available for [Android](https://play.google.com/store/apps/details?id=com.augmentra.viewranger.android&hl=en) and [iOS](https://itunes.apple.com/us/app/viewranger-hiking-cycling-trails/id404581674?mt=8)) when I noticed today that it's also possible to track your position and store it as [GPX](https://en.wikipedia.org/wiki/GPS_Exchange_Format) on Dropbox.
Feel free to use the app that works for you. If you app can store GPX logs on Dropbox it's compatible with this workflow.

Now it was a matter of finding a way to update my raw files [EXIF](https://en.wikipedia.org/wiki/Exif) GPS position based on these GPX files.
Turns out that [exiftool](http://www.sno.phy.queensu.ca/~phil/exiftool/geotag.html) which I already had installed has the capability to exactly do this.

For example running following command would update all GPS locations of the images in folder `images` using the `mylog.gpx` file.

```
exiftool -geotag mylog.gpx /images
```

I wanted a somewhat more automated way of doing this so I've written a bash script that would find all GPX files that start with `log` and update all my albums in my Dropbox.
At the moment I run this manually but I will automate this using a cron or so later on.

```
#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DROPBOX_DIR=$(dirname "$DIR")
PHOTO_DIR="$DIR/Original"
GPX_DIR="$DROPBOX_DIR/Apps/ViewRanger"

for gpx in $GPX_DIR/log-*.gpx; do
    for album in $PHOTO_DIR/*; do
        if [ -d "${album}" ]; then
            OUTPUT=$(exiftool -overwrite_original -geotag="$gpx" "$album" 2> /dev/null)
            if [[ $OUTPUT != *"0 image files updated"* ]]; then
                ALBUM_NAME=$(basename $album)
                GPX_NAME=$(basename $gpx)
                echo "updated $album using $GPX_NAME"
            fi
        fi
    done
done
```

The reason I prefer to prefix my track file using `log` is because I also store a list of hike and mountain bike trails in the same Dropbox folder.
This way it's easier to see the difference between the different types of GPX files.
This name convention will also speed up the above script because it will ignore irrelevant files.

One last thing that I've been thinking about doing is moving the GPX log file to the photo album folder.
This way you will have all your raw files and the route that you walked to take all these pictures in one place.
