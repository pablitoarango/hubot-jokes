# Hubot Jokes

[![Travis branch](https://img.shields.io/travis/WhosPablo/hubot-jokes/master.svg)](https://travis-ci.org/WhosPablo/hubot-jokes)
[![npm](https://img.shields.io/npm/v/hubot-jokes.svg)](https://www.npmjs.com/package/hubot-jokes)


A hubot script that retreives random reddit jokes by building on [original reddit-jokes script by tombell and ericjsilva](https://github.com/github/hubot-scripts/blob/master/src/scripts/reddit-jokes.coffee)

See [`src/jokes.coffee`](src/jokes.coffee) for full documentation.



## Installation

In hubot project repo, run:

`npm install hubot-jokes --save`

Then add **hubot-jokes** to your `external-scripts.json`:

```json
[
  "hubot-jokes"
]
```

## Commands

### Tell me a joke

Retreive a random joke from /r/cleanjokes

### Tell me a \<type\> joke *or* \<type\> joke

If type is one of the allowed types it'll retreive a random joke from corresponding subreddit

Allowed types and corresponding subreddit:
* simple - r/jokes
* dad - r/dadjokes
* mom - r/mommajokes
* yo momma - r/mommajokes
* clean - r/cleanjokes
* classy - r/classyjokes



## Sample Interaction

```
user1>> hubot tell me a joke
hubot>> <random joke from r/cleanjokes >
```

```
user1>> hubot tell me a dad joke
hubot>> <random joke from r/dadjokes >
```

```
user1>> hubot yo momma joke
hubot>> <random joke from r/mommajokes >
```

## NPM Module

https://www.npmjs.com/package/hubot-jokes
