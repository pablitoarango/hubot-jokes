require('es6-promise').polyfill()
Helper = require('hubot-test-helper')
chai = require('chai')
nock = require('nock')

expect = chai.expect

helper = new Helper('../src/jokes.coffee')

tests = [
  ['simple', 'r/jokes'],
  ['dad', 'r/dadjokes'],
  ['mom', 'r/mommajokes'],
  ['yo momma', 'r/mommajokes'],
  ['classy', 'r/classyjokes'],
  ['clean', 'r/cleanjokes']
]

describe 'jokes', ->
  beforeEach ->
    @room = helper.createRoom()
    do nock.disableNetConnect

    
    nock('https://www.reddit.com')
      .get('/'+test[1]+'.json')
      .reply( 200, {data:{children: [{
        data:{
          title: 'This is not a joke',
          selftext: 'its a test for '+test[1]+'!'
        }
      }]}}) for test in tests

  afterEach ->
    @room.destroy()
    nock.cleanAll()

  context 'user asks \"hubot tell me a joke\"', ->
    beforeEach (done) ->
      @room.user.say('alice', '@hubot tell me a joke')
      setTimeout done, 100

    it( 'responds with a joke from r/cleanjokes', ->
      expect(@room.messages).to.eql [
        ['alice', '@hubot tell me a joke']
        ['hubot', 'This is not a joke its a test for r/cleanjokes!']
      ])

  for test in tests
    do (test) ->
      context 'user asks \"hubot tell me a '+test[0]+' joke\"', ->
        beforeEach (done) ->
          @room.user.say('alice', '@hubot tell me a '+test[0]+' joke')
          setTimeout done, 100

        it( 'responds with a joke from '+test[1], ->
          expect(@room.messages).to.eql [
            ['alice', '@hubot tell me a '+test[0]+' joke']
            ['hubot', 'This is not a joke its a test for '+test[1]+'!']
          ])

  for test in tests
    do (test) ->
      context 'user says \"hubot '+test[0]+' joke\"', ->
        beforeEach (done) ->
          @room.user.say('alice', '@hubot '+test[0]+' joke')
          setTimeout done, 100

        it( 'responds with a joke from '+test[1] , ->
          expect(@room.messages).to.eql [
            ['alice', '@hubot '+test[0]+' joke']
            ['hubot', 'This is not a joke its a test for '+test[1]+'!']
          ])

  context 'user asks \"hubot gimme a joke\"', ->
    beforeEach (done) ->
      @room.user.say('alice', '@hubot gimme a joke')
      setTimeout done, 100
    it( 'does not respond to gimme a joke' , ->
      expect(@room.messages).to.eql [
        ['alice', '@hubot gimme a joke']
      ])

  context 'user asks \"hubot joke\"', ->
    beforeEach (done) ->
      @room.user.say('alice', '@hubot joke')
      setTimeout done, 100
    it( 'does not respond to just joke' , ->
      expect(@room.messages).to.eql [
        ['alice', '@hubot joke']
      ])

