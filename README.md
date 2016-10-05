# Hubot Reddit Jokes

A hubot script that retreives random reddit jokes building on [original reddit-jokes script by tombell and ericjsilva](https://github.com/github/hubot-scripts/blob/master/src/scripts/reddit-jokes.coffee)

See [`src/reddit-jokes.coffee`](src/reddit-jokes.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-reddit-jokes --save`

Then add **hubot-reddit-jokes** to your `external-scripts.json`:

```json
[
  "hubot-reddit-jokes"
]
```

## Commands

### Tell me a joke

Retreive a random joke from /r/jokes

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
hubot>> <random joke from r/jokes >
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

https://www.npmjs.com/package/hubot-reddit-jokes
