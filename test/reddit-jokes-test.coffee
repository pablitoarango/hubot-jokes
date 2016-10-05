Helper = require('hubot-test-helper')
chai = require('chai')
nock = require('nock')

expect = chai.expect

helper = new Helper('../src/reddit-jokes.coffee')

tests = [
  ['simple', 'r/jokes'],
  ['dad', 'r/dadjokes'],
  ['mom', 'r/mommajokes'],
  ['yo momma', 'r/mommajokes'],
  ['classy', 'r/classyjokes'],
  ['clean', 'r/cleanjokes']
]

describe 'reddit-jokes', ->
  beforeEach ->
    @room = helper.createRoom()
    do nock.disableNetConnect

    
    nock('https://www.reddit.com')
      .get('/'+test[1]+'.json')
      .reply( 200, {data:{children: [{
        data:{
          title: 'This is not a joke',
          selftext: 'its a test from '+test[1]+'!'
        }
      }]}}) for test in tests

  afterEach ->
    @room.destroy()
    nock.cleanAll()

  it( 'responds to tell me a joke with a joke from r/jokes' , ->
    @room.user.say('alice', '@hubot tell me a joke').then =>
      expect(@room.messages).to.eql [
        ['alice', '@hubot tell me a joke']
        ['hubot', 'This is not a joke its a test from r/jokes!']
      ])

  for test in tests
    do (test) ->
      it( 'responds to tell me a '+test[0]+' joke with a joke from '+test[1] , ->
        @room.user.say('alice', '@hubot tell me a '+test[0]+' joke').then =>
          expect(@room.messages).to.eql [
            ['alice', '@hubot tell me a '+test[0]+' joke']
            ['hubot', 'This is not a joke its a test from '+test[1]+'!']
          ])

  for test in tests
    do (test) ->
      it( 'responds to '+test[0]+' joke with a joke from '+test[1] , ->
        @room.user.say('alice', '@hubot '+test[0]+' joke').then =>
          expect(@room.messages).to.eql [
            ['alice', '@hubot '+test[0]+' joke']
            ['hubot', 'This is not a joke its a test from '+test[1]+'!']
          ])


  it( 'does not respond to gimme a joke' , ->
    @room.user.say('alice', '@hubot gimme a joke').then =>
      expect(@room.messages).to.eql [
        ['alice', '@hubot gimme a joke']
      ])
  it( 'does not respond to just joke' , ->
    @room.user.say('alice', '@hubot joke').then =>
      expect(@room.messages).to.eql [
        ['alice', '@hubot joke']
      ])

