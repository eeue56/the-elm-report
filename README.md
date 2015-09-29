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

### Web development as of 2015

Web development is a weird thing. Out of most modern platforms, it reaches to the largest consumer base, along with the largest developer base. As a result, you have many different approaches to doing the same thing. 


There is little agreement across these different developer groups


--

![use Jquery](http://www.doxdesk.com/img/updates/20091116-so-large.gif)
--

### So what's this all about?


This paper is going to look at a small section of the web development world. In particular, we are going to look at Elm and how some of the concepts in Elm aim to solve some of the issues with modern Javascript.

--

# Intro to Elm

--

### Elm is..

 * designed around FRP
 * inspired heavily by Haskell
 * HTML implementation inspired by React

--

### Who does Elm appeal to?

Elm appeals to three main markets: 
 * Those who use Haskell
 * Those who use React
 * Those who enjoy learning languages

Elm provides a framework similar to React, in a language similar to Haskell.

--

# Functional Reactive Programming (FRP)

## A new way to write interactive code

--

### What exactly is FRP?

Functional reactive programming (FRP) is a way of modelling values that change over time. 

Rather than representing changes by manually updating some variable to store the value, instead FRP works on the principle of using functional-style maps, folds and filters to express code that can be deemed reactive to some value

--

### FRP example


The current time is a perfect example of FRP.
In a non-reactive language, you can model changes in time through a couple of different ways -

```python
    while True:
        current_time = datetime.now()
        time.sleep(1000)
``` 

```javascript
    setInterval(function({
        currentTime = (new Date()).getHours();
    }), 1000);
```

whereas in an FRP based language, you would instead do -

```haskell
    Signal.map timeView (every second)
```

--

### Why are people excited about FRP?

FRP provides a way of modelling programs without the need for callback hell, simplifying the code base. 

Instead of worrying about how to update variables, instead the developer can write code focusing on how the variable should be used.

--

### Javascript solutions

Solutions such as [`RxJs`](0) already exist and are used in the wild. The lack of FRP-support built-in means that code for expressing models can be complicated

[RxJs](https://github.com/Reactive-Extensions/RxJS)

--

### Back to Elm

An example with RxJS:

```javascript
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
The previous example in Elm looks like this

```haskell
moreThan30 = List.filter (\quote -> quote.price > 30)
logItem v = log "Prices higher than $40: $"
Signal.map (moreThan30 >> List.map logItem) getStockData

```

--

### It's neater, right?

Having a language designed around Elm, with inspiration from Haskell, means you end up with things like this -

```haskell
Signal.map : (a -> b) -> Signal a -> Signal b
```

Signal.map applies functions to data contained within a Signal.


--

### The use of functors

Elm enables the developer to write their functions ignoring how signals work internally. 

This enables them to express a program at higher level of abstraction, simplifying both the writing and reading of code.

Elm therefore is very exciting to developers.

--

### Sounds great, what's wrong with it?

My paper aims to:
 * compare Elm to existing frameworks for simplifying web-based applications
 * examine the structure of an Elm application
 * examine why Elm has yet to see wide adoption
 * highlight potential steps for increasing production adoption

--

### What are the current alternatives?

Picking alternatives in the web development community is never an easy thing. 

There is a common joke of "x days since a new Javascript framework has been released". 

There's even a website [dedicated](http://www.isaacchansky.me/days-since-last-new-js-framework/) to it.
--

## js framework jokes

<img src="images/days_since_js_framework.png" width="100%"></img>


--

### Javascript alternatives


There are many Javascript frameworks out there. For this project, we will look at Angular.js and React.js

#### Angular

Structured around controlling everything through JS.

#### React

Structured around limiting the scope of a section of HTML.

-- 

### Haskell alternatives

There's also many "compile to Javascript" languages out there. We'll be looking at Haskell-based alternatives such as Fay and GHC.js.

#### Fay

Fay is a Haskell subset which exposes a FFI which allows the developer to run any JS code with backing from Haskell's type system

#### GHC.js

GHC.js is a Haskell subset with a library for creating HTML elements

--