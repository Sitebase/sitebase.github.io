---
layout: post
title: "Simple Vim note taking in markdown"
description: "Basic workflow for markdown note taking in Vim without the need for a single plugin."
tags: [vim, productivity]
image:
  opacity: 0.9
  feature: posts/2022/vim-note-taking-markdown-folds-min.webp
  alt: Folds in Vim
credit:
  creditlink:
comments: true
share: true
---
An essential part of my day exists out of taking notes. I currently still use Evernote and paper for this, but I wanted to have a more lightweight option on the side.
The goal was to make taking shorter notes more straightforward and convenient by tieing it into my current work setup, being tmux+Vim.

## Single markdown file
My solution for this is a single markdown file which has some advantages over some of the full-blown note-taking apps and plugins.

* Easy to search
* No plugins needed
* No new Vim moves you need to learn

![Example of folds in Vim](/images/posts/2022/vim-note-taking-setup-min.jpg)

So, for now, create a `notes.md` file and maybe also add an alias to your dotfiles to make it easier to access your notes, and you're all set up.

To focus on the current note I'm working on, I like to use folds to collapse all notes that I'm not actively using.
Let's set that up next.

## Vim Modeline
I must admit that having a plain markdown file isn't that interesting yet. But let's expand on this and make it more usable with modelines.

Modeline allows you to overwrite Vim config settings inline in your file. This is ideal for this situation where we need to specify some particular fold configuration.

By default, this is not enabled in Vim, so you need to enable the modeline setting in Vim. We also need `modelineexpr` because we use some functions to display a clean `foldtext`. That's the line shown representing a collapsed fold.

```
set modeline
set modelineexpr
set modelines=4
```

Now that your Vim is modeline-ready you can add the following lines at the bottom of your notes file.

```
" vim: foldmethod=marker foldmarker=\#\ \ ,--- foldlevel=0 noet
" vim: foldtext=substitute(getline(v\:foldstart),"\#\ \ ","\ \→\ ","g").repeat("\-",winwidth(0)-strlen(getline(v\:foldstart))-15)."\ ≋\ ".string(v\:foldend-v\:foldstart+1)
```

I use the markdown hashtag header as a fold start marker and a
horizontal rule as the end of the fold. This makes it possible to write just plain markdown
without cluttering your notes with default fold markers `{ { {` and `} } }` which is the default in Vim.

In the `foldtext` setting, I clean up the note title by stripping the hashtag. And the last part is some calculation to nicely align the number of lines each note item has.

I also use two spaces after the hashtag as a fold open marker. Without the double space, your folds will mess up if you use double hashtag titles in your notes. I didn't find another good solution for that for now, so any suggestions are welcome.

Be aware of the possible [security implications](https://security.stackexchange.com/questions/36001/vim-modeline-vulnerabilities) of modelines. A good security practice here is probably to only enable modelines on specific files.

## Github Gist
One crucial functionality in note-taking is syncing it somehow to an online service to unlock the following:

* Backups
* Note-taking on multiple computers
* Reading notes on mobile while on the road

My approach here is to use [Github gists](https://gist.github.com/). Which will give you the power of a repository (revisions) without the added overhead of needing to write commit messages and pushing/pulling.

To make this possible, you only need to install the [Github CLI tool](https://cli.github.com/).
After installing, you can open an existing gist in Vim ($EDITOR) with:

```
gh gist edit ID_OF_YOUR_GIST
```

To make this easier to use, I've created some aliases for a few different gists, so it's straightforward to open one up.


```
alias note="gh gist edit $GIST_GENERAL"
alias kb="gh gist edit $GIST_KNOWLEDGE"
alias todo="gh gist edit $GIST_TODO"
```

At the bottom of each of these gists I have the modelines explained above, and that's it.
You're all set up and ready to take some notes without any additional Vim plugins required.

Make sure to keep this gist ID secret because anyone who knows the ID can access it.
No authentication is required. That's why I used variables for these in my dotfiles, and the actual IDs are in an encrypted file.

Below is a screenshot of how your notes look in the browser on Github. A cleanly formatted overview of all your notes 🎉.

![Github gist markdown rendered view](/images/posts/2022/vim-note-gist-markdown-min.png)

I hope this approach inspired some of you.
Happy note-taking!
