---
layout: post
title: "Automate desktop cleanup"
description: "How to automate a daily clean up of your messy desktop use cron and a small little bash script."
tags: [tip, automate]
image:
  opacity: 0.9
  feature: posts/2017/desktop-cleanup-mess.jpg
credit:
  creditlink:
comments: true
share: true
---
Probably most of you are familiar with something looking like the image above.
A desktop with a pile of irrelevant and unused files.
I was totally fed up with the fact that after each work day my desktop looked like a war zone.
The solution: cron in combination with some lines of bash.

First we have to determine how to detect which files can be archived and which are not.
My idea was to ignore folders, because these are most of the time things that I want to keep on my Desktop.
For files I look at the last modified date, if this is not modified in the last 24 hours, I move it to my archive folder.

The archive folder is a folder that I keep on my desktop.
This folder contains subfolders for each day the script runs.

![Archive folder](/images/posts/2017/desktop-cleanup-archive-folder.jpg)

Below is the bash script for cleaning up the desktop.
Copy the code to a file called something like `clean-desktop.sh`.
Give the script execution permission using `chmod +x clean-desktop.sh`.
Make sure to put the script somewhere else than your desktop, otherwise the script will clean up itself 😝.

```
#!//bin/bash

ARCHIVE_DIR=~/Desktop/archive
DATE=$(date +"%Y%m%d")
EXPIRE=1449 # in minutes (1449 = 1 day)

cd ~/Desktop
FOLDER="$ARCHIVE_DIR/$DATE"
mkdir -p $FOLDER

find . -type f -mmin +$EXPIRE -maxdepth 1 -exec ls -u {} \; | while read line; do
    echo $line
    mv "$line" "$FOLDER"
done

echo "Archived all expired files"
```

I first wanted to run this each time just before my Mac book goes into sleep mode.
It turns out that there isn't any build in way to do this.
As I wanted to keep this script dependency free, I've settled on using cron.

I run my script once a day at 5PM.
To do this add following line to your cron:

```
0 17 * * * path/clean-desktop.sh
```

Enjoy!
