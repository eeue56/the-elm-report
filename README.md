title: The Elm Report
author:
  name: Noah
  url: https://github.com/eeue56
output: basic.html
style: style.css
override: true
controls: true

--

# The Elm Report
## The state of Elm in the modern web development world

--

### Intro to Elm
Elm is..

 * designed around FRP
 * inspired heavily by Haskell
 * HTML implementation inspired by React

--

### What exactly is FRP?

FRP is a way of modelling values that change over time. Rather than representing changes by manually updating some variable to store the value, instead FRP works on the principle of using functional-style maps, folds and filters to express code that can be deemed reactive to some value

--

### FRP example


The current time is a perfect example of FRP.
In a non-reactive language, you can model changes in time through a couple of different ways -

```
    while True:
        current_time = datetime.now()
        time.sleep(1000)
``` 

```
    setInterval(function({
        currentTime = (new Date()).getHours();
    }), 1000);
```

whereas in an FRP based language, you would instead do -

```
    Signal.map timeView (every second)
```

--

### Why are people excited about FRP?

FRP provides a way of modelling programs without the need for callback hell, simplifying the code base. 

Instead of worrying about how to update variables, instead the developer can write code focusing on how the variable should be used.

--

### Javascript solutions

Solutions such as [`RxJs`](0) already exist and are used in the wild. The lack of FRP-support built-in means that code for expressing models can be complicated

```
var source = getAsyncStockData();

var subscription = source
  .filter(function (quote) {
    return quote.price > 30;
  })
  .map(function (quote) {
    return quote.price;
  })
  .subscribe(
    function (price) {
      console.log('Prices higher than $30: $' + price);
    },
    function (err) {
      console.log('Something went wrong: ' + err.message);
    });
subscription.dispose();

```

[RxJs](https://github.com/Reactive-Extensions/RxJS)

--

### Back to Elm

The previous example in Elm looks like this

```
moreThan30 = List.filter (\x -> x.price > 30)
logItem v = log "Prices higher than $40: $"
Signal.map (moreThan30 >> List.map v) getStockData

```

Elm therefore is very exciting to developers.
