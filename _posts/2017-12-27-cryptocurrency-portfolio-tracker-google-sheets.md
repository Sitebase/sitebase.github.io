---
layout: post
title: "Cryptocurrency portfolio tracker with Google Sheets"
description: "How I track my cryptocurrency portfolio from multiple exchanges with a custom Google Sheets tracker"
tags: [cryptocurrency, trading]
image:
  opacity: 0.9
  feature: posts/2017/trade-candle-graph-crypto.jpg
credit:
  creditlink:
comments: true
share: true
---
When you are active in the crypto world you'll know that having 3 or more
different exchange accounts is not a strange thing. Certain coins (especially new ones)
will only be listed on certain exchanges until they reach a certain
cryptocurrency market capitalization which will force other exchanges to adopt them.

![Cryptocurrency dashboard](/images/posts/2017/cryptocurrency-tracker-dashboard.jpg)

This means that if you want to have a diverse portfolio of coins you will have to
register on a few different exchanges to be able to buy into these new and upcomming coins.

Ofcourse with multiple exchange accounts comes the problem of having multiple portfolios
which will be very hard to keep track of.
Also most exchanges don't give you a lot of insights about coins you bought.
Things like cost average are pretty essential to get an idea about when you start to make a profit with a certain coin.

To solve this problem I've created a Google Sheet that can help you with this.
I know that there are already a shit load of Google Sheets, Excel sheets and HTML implementations of
this but none of them did actually what I wanted so I decided to create my own.

## The Missing Pieces
Like I told before: I came across a bunch of implementations but most of them were
bad implementations or didn't report the most usefull metrics. To give you some examples:

* Some implementations were using [coinmarketcap API](https://coinmarketcap.com/api/) to fetch details for each coin.
On first sight this isn't a problem wasn't it for the request limit of 10 requests per minute.
So if you have a portfolio of more then 10 coins your tracker would break.
* Data update needed to be triggered manually and I don't like manual work, even if it's clicking one single button.
* Most, if not every tracker I've looked at just used a total number of coins to calculate a current wallet value.
The big problem is that you can't calculate a cost AVG of what you payed for your total amount of a specific coin.
Without this metric it's almost impossible to know from which point you are making a profit.
* Some of the sheets I've seen used a ton of code to get prices from the coinmarketcap API into their sheet.
There is a much simpeler and cleaner way of doing this if you use something like [ImportJSON](https://github.com/bradjasper/ImportJSON).
* A design that doesn't make me feel stuck in 1999

## My Tracker Implementation
My implementation is based on a order history. So if you buy or sell coins on any
exchange you'll add it to the `Order History` of the Google Sheet.

![Cryptocurrency order history](/images/posts/2017/cryptocurrency-tracker-order-history.jpg)

All the other hard work and calculations is done for you. Based on these orders and
data from the coinmarketcap API the sheet will calculate a bunch of usefull metrics
which will be presented in a nice and digestable way.

![Cryptocurrency tracker wallet](/images/posts/2017/cryptocurrency-tracker-wallet.jpg)

## Get Started with my Crypto Tracker
Feel free to start using my cryptocurrency portfolio tracker Google Sheet.
To start using it follow these steps:

1. Open the [Crypto Tracker](https://docs.google.com/spreadsheets/d/1fahEwCjovO0DzkyZw6gftisT_uVLehTaU7reKRTFvdk/edit?usp=sharing)
2. Go to `File` > `Make a copy ...` and save the copy to your drive
3. Go to `Tools` > `Script Editor...`
4. Add 2 triggers via `Edit` > `Current project's triggers`. First add a trigger that calls `refresh` every hour. A second trigger should call `refresh` on spreadsheet open.
5. Close the script editor and go to the `Wallet history` tab and remove all data
6. Now you once have to insert all previous orders you made on all exchanges you are using

Any feedback, remarks or ideas are welcome in the comments.
