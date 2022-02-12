---
layout: post
title: "Bullet proof photo naming convention"
description: "What's the best way to name all photos you take with a wide range of different devices."
tags: [photo, photography, workflow]
image:
  opacity: 0.9
  feature: posts/2020/photo-naming-convention.png
  alt: Photo naming convention
credit:
  creditlink:
comments: true
share: true
---
The devil is in the details, and this also applies to something as simple as finding the right naming convention for your precious photos.

This article is an addition to [My photo management workflow](https://www.sitebase.be/my-photo-management-workflow/) that I wrote in 2016.

I think it’s clear that there isn’t one best photo naming convention because it will heavily depend on the photo workflow you are using. But, I still think that there will be some interesting takeaways for everyone in how my convention is structured.

To dive right in below, you find some examples of filenames using my naming convention:


```
20110113_185345_nikond80_8743e6d.jpg
20130328_114119_iphone3gs_91a4a5c.jpg
20200412_105342_nikond7100_def5ff8.nef
```

## Break down

Let's take this example `20200412_105342_nikond7100_def5ff8.nef` and break it up in pieces:

### Date and time
The first part of the filename (`20200412_105342`) represents the date, and the time the photo was taken.

I'm using the ISO 8601 standard here were you order the units of time from the largest to the smallest: year, month, day, hour, minute, and second.
Doing this will give you some advantages:

* A European (and most of the rest of the world) would read 01-12-2001 as December 1st, 2001, whereas a person from the United States would see it as January 12th, 2001.
Using the ISO standard for the dates will prevent misreading of the dates.
* Because the ISO formatted date is the first part of the filename, it's very easy to chronologically order your photos in a file explorer.

### Camera
The second part in our example (`nikon7100`) represents the camera used to take the photo.
This camera part will make it possible to search for all photos taken with a particular camera quickly.

### Hash
The third part to talk about is the hash (`def5ff8`), which is probably also the most significant differentiation point with most other photo naming conventions you'll find online.
To ensure that the hash stays the same, we need to use raw files and store your file modifications in a sidecar XMP file. If you save photo modification in the file itself, it will change the binary and, as a result, also the actual hash of the photo.

The hashing function that I use is SHA-1, which will give me a fixed size short string representation for a given photo. Interesting here to note is that a given picture will always produce the same hash. From this hash, I then only use the seven first characters.

But what is the added value of adding this to your filenames? It turns out that this small piece of information is super powerful and gives you many advantages.

* Running my naming convention on one photo will always generate the same filename.
It's is a significant advantage over some other convention where you would rely on incremental numbers.  If you rename the picture with my convention and drop it in your library, your OS will show you that there is already a file in the folder with the same name.
* Imagine if you would only use date and time in your filename. What would happen if you take a collection of photos in burst mode. You'll probably be going to end up with two or more images having the same name and potentially overwriting each other, depending on the tools you are using to rename your files. And if you want to keep these photos, you'll have to diverge from your convention slightly because you'll have to add an extra incremental number. By using a hash, each picture will have a unique name by default.

### Extension
The last part is the extension, where I always use lowercase letters. There is no real advantage here apart from the convention itself, which keeps everything consistent.

## Github
I've converted this naming convention into a [bash script](https://github.com/sitebase/photoname) that can be used to apply my convention easily to your own photos.

