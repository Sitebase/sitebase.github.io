---
layout: post
title: "Generate Phillips Hue API token"
description: "How to generate an API token for your Phillips Hue lights? This makes it possible to send requests to your bridge to control your lights."
modified: 2015-08-20 08:52:48 +0200
tags: [home automation, electronics, api]
image:
  feature: posts/2016/phillips-hue-lights-warm.jpg
  alt: Phillips Hue lamps coloring living area
  credit:
  creditlink:
comments:
share:
---

If you want to start to do some experimenting with your Phillips Hue lights chances are that you'll need to use the Hue API sooner or later.
To use this API you will need to get a token but at the moment there is no official way to do this.


You can do it as follows:

* Get your bridge IP via `https://www.meethue.com/api/nupnp`
* Go to the API debugger `http://<bridge ip address>/debug/clip.html` and use `/api/` as URL and message body `{"devicetype":"my_hue_app#hue app"}`.

![Phillips Hue API debugger](/images/posts/2016/phillips-hue-api-debugger.jpg)

* Press the button on your bridge and now push the `POST` button on the debugger.
* You should see a response like:

{% highlight json %}
    [
        {
            "success": {
                "username": "7fbb0cd252f3787c2b81892b03d8a9"
            }
        }
    ]
{% endhighlight %}

* `username` is the token you can use to control your lights.

## Example usage

{% highlight bash %}
curl -X PUT --data '{"bri":42}' http://<bridge ip address>/api/<username>/lights/1/state
{% endhighlight %}
