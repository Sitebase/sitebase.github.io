---
layout: post
title: "Disabling focus outline without breaking accessibility"
description: "Using this technique you can remove the focus outline without breaking the accessibility for keyboard users"
modified: 2016-06-24 20:35:17 +0100
tags: [accessibility, javascript, css]
image:
  opacity: 0.4
  feature: posts/2016/accessibility.jpg
  credit:
  creditlink:
comments: true
share: true
---
Under web developers it's still a common practice to disable
the browser focus [outline](https://developer.mozilla.org/en/docs/Web/CSS/outline).
Shamefully I need to admit that, before today, I also did this. But let's stop this
bad habit by providing a good solution that both designers and accessibility gurus can live with.


![Text input field focus example](/images/posts/2016/text-input-focus.jpg)

## The problem
Disabling the focus outline will give a keyboard user a hard time knowing
where on the page he actually is. So this practice is like saying to a segment of
your visitors: we don't care about you, spend your money and time somewhere else.

Another common pattern is using a low contrasting color for the outline, instead of the default
blue color. You can hardly call this practice better than setting the outline to `none`.

![Low contrast focus outline example](/images/posts/2016/low-contrast-focus-outline.jpg)

The point of this article: there is a solution so you don't have to
choose between **accessibility but ugly outlines** vs **clean layout and no accessibility**.

## An accessible solution
What we can do is show the outlines by default. Once a user clicks with the mouse
somewhere on the page, we inject CSS that disables the outline.

```
*:focus {
    outline: 0;
}
```

Once we receive a keyboard event we remove the above CSS block again,
resulting in visible focus outlines while navigating with the keyboard.

It amazes me that almost all StackOverflow posts and articles regarding this topic
suggest to disable the outline without mentioning this, clearly, better solution.

At [Ambassify](https://www.ambassify.com), while working on the accessibility of our
ReactJS components, I created [smart outline](https://github.com/ambassify/smart-outline)
which is a implementation of this technique.

## What do you think?
I'm curious what you think about this solution. I'm by no means an accessibility expert,
so is it possible that I'm missing some edge cases that could potentially cause problems
for some keyboard users?

## References
* WCAG 2.0 Success Criterion [2.4.7 Focus Visible](https://www.w3.org/TR/WCAG20/#navigation-mechanisms-focus-visible) (Level AA)
* [GitHub](https://github.com) is also using this technique on their homepage
