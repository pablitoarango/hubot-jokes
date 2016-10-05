# Description
#   A hubot script that retreives random jokes from multiple subreddits
#
# Configuration:
#   None
#
# Commands:
#   hubot tell me a joke - Replies with random joke from /r/jokes
#   hubot tell me a <allowed-type> joke -
#       Replies with random joke from /r/<allowed-type>jokes
#   hubot <allowed-type> joke -
#       Replies with random joke from /r/<allowed-type>jokes
#
# Notes:
#   Allowed types:
#			simple - r/jokes
#			dad - r/dadjokes
#			mom - r/mommajokes
#			yo momma - r/mommajokes
#			clean - r/cleanjokes
#			classy - r/classyjokes
#
# Author:
#   whospablo, tombell, ericjsilva

module.exports = (robot) ->
  sendJokeFrom = (msg, url) ->
    msg.http("https://www.reddit.com/r/#{url}.json")
    .get() (err, res, body) ->
      try
        data = JSON.parse body
        children = data.data.children
        joke = msg.random(children).data

        joketext = joke.title.replace(/\*\.\.\.$/,'') +
        ' ' + joke.selftext.replace(/^\.\.\.\s*/, '')

        msg.send joketext.trim()

      catch ex
        msg.send "I can't tell you a joke :'( - #{ex}"

  robot.respond /(tell me a )?(.*)joke$/i, (msg) ->
    did_ask = msg.match[1]
    type = msg.match[2].trim()

    if type is "dad"
      sendJokeFrom(msg, "dadjokes")
    else if type is "clean"
      sendJokeFrom(msg, "cleanjokes")
    else if type is "mom"
      sendJokeFrom(msg, "mommajokes")
    else if type is "yomomma"
      sendJokeFrom(msg, "mommajokes")
    else if type is "yo momma"
      sendJokeFrom(msg, "mommajokes")
    else if type is "classy"
      sendJokeFrom(msg, "classyjokes")
    else if type is "simple" or did_ask
      sendJokeFrom(msg, "jokes")