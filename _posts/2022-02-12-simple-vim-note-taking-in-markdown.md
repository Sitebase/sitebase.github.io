---
layout: post
title: "Simple Vim note taking in markdown"
description: "Basic workflow for markdown note taking in Vim without the need for a single plugin."
tags: [vim, productivity]
image:
  opacity: 0.9
  feature: posts/2022/vim-note-taking-markdown-folds-min.png
credit:
  creditlink:
comments: true
share: true
---
After looking into some of the schematics, it turns out that you indeed need a 12v signal trigger (blue line) to turn the power supply on. The 12v will activate an [opto-isolator](https://en.wikipedia.org/wiki/Opto-isolator) `PC911` and wakes the subwoofer.

![LOEWE subwoofer schematics trigger standalone](/images/posts/2022/vim-note-taking-setup-min.png)

This is another excellent piece of vendor lock-in. In my brother's case, the TV broke, so you are obligated to buy another LOEWE TV or face the fact that you're stuck with a costly brick of a few thousand euros.

## Single file
simple advantages
easy to search

sometimes it's best to start with something small and see what you miss when using it and build from there instead of trying to build the holy grail from day 1. I think it's a good way of working and a good strategy to also use as a software developer.

## Vim Modeline
Modeline allows you to inline overwrite your Vim config with some specific settings for the file itself.

Enable following options
```
set modeline
set modelineexpr
set modelines=4
```

```
" vim: foldmethod=marker foldmarker=\#\ \ ,--- foldlevel=0
" vim: foldtext=substitute(getline(v\:foldstart),"\#\ \ ","\ \→\ ","g").repeat("\-",winwidth(0)-strlen(getline(v\:foldstart))-15)."\ ≋\ ".string(v\:foldend-v\:foldstart+1)
```

## Github Gist
One important functionallity in note taking is syning it somehow to an online service
to unlock the following:

* backups
* note taking on multiple computers
* reading notes on mobile while on the road

My aproach here is to use [Github gists](https://gist.github.com/). Which will give
you the power of a repository (revisions) without the added overhead of needing
to write commit messages and pushing/pulling.

All you need to do this is the [Github CLI tool](https://cli.github.com/).
After installing you can open a existing gist in Vim ($EDITOR) with:
```
gh gist edit ID_OF_YOUR_GIST
```
To make this easier to use I've created some aliases for a few different gists (note files)
so it's very easy to open one up.

```
alias note="gh gist edit $NOTE_GENERAL"
alias kb="gh gist edit $NOTE_KNOWLEDGE"
alias kb="gh gist edit $NOTE_TODO"
```

At the bottom of each of these gist I have the modelines explained above and that's it.
You're all set up and ready to take some notes with any additional Vim plugins required.

Make sure to keep this gist ID secret because anyone know they ID can access it.
No authentication required. That's the reason I used variables for these in my dotfiles
and the actual IDs are in an encrypted file.

Below is a screenshot how your notes look in the browser on Github. A clear searchable
batch of text.

![Github gist markdown rendered view](/images/posts/2022/vim-note-gist-markdown-min.png)

## Missing pieces
No images
not ideal for very complex note taking and thinking out large project
most of the time I fall back to pen paper
