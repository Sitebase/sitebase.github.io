---
layout: post
title: "React avatar ES6 rewrite"
description: "A new version of React avatar is available. The code is completely rewritten in ES6."
modified: 2016-05-15 20:35:17 +0100
tags: [es6, javascript, reactjs]
image:
  opacity: 0.4
  feature: posts/2016/avatars.jpg
  alt: avatars gallery
  credit:
  creditlink:
comments: true
share: true
---
After some hectic weeks, preparing for the birth of our son, I've finally found some time to finish up the rewrite of my [react avatar component](https://github.com/Sitebase/react-avatar). The code base was becoming a complete mess.


## What has changed?

### Goodbye Grunt
I see a lot of small projects using build systems like [Grunt](http://gruntjs.com/) or [Gulp](http://gulpjs.com/) while they just need some basic functionality that you can write without these, often bulky, build systems.

You can for example do a lot with the build in [NPM script property](https://docs.npmjs.com/misc/scripts). There are some default script handles that it supports, but you can also [add your own](https://github.com/Sitebase/react-avatar/blob/master/package.json#L6-L12).

I really like this approach because it's simple you don't need all the extra dependencies. I'm not saying that you need to stop using Grunt at all, we use Grunt a lot at [BuboBox](https://bubobox.com) and [Ambassify](https://www.ambassify.com), but sometimes the commands are so simple that it's much easier to use NPM scripts.

### ES6
The project is completely rewritten from the ground up. I've extracted all the handling of the different sources into [separate source classes](https://github.com/Sitebase/react-avatar/tree/master/src/sources) which makes it much easier to understand and extend.

### Color flicker on rerender
If you used the previous version of react avatar and used the built in random color function you probably noticed the color flicker problem. Each rerender would render the avatar in a new color regardless the value being the same or not. The implementation is now rewritten so that a certain value will get the same color assigned, every time.

I've done this by doing a [sum of all ASCII values](https://github.com/Sitebase/react-avatar/blob/master/src/utils.js#L29-L52), and using this value to pick a color from fixed array of colors.

## Upgrade
If you are already using React avatar you can just upgrade without any changes. I've bumped the major version number to reflect the rewrite, but no breaking changes were introduced.
