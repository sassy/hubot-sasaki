chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'hubot-sasaki', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()
      enter: sinon.spy()
      leave: sinon.spy()

    require('../src/sasaki')(@robot)

  it 'registers a sasaki respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/sasaki/i)

  it 'registers a good respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/good/i)

  it 'registers a "where do yo go? respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/どこ(い|行)く\?/i)

  it 'registers a thx respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/thx/i)

  it 'registers a hear listener', ->
    expect(@robot.hear).to.have.been.calledWith(/kakuni/i)

  it 'registers a hear listener', ->
    expect(@robot.hear).to.have.been.calledWith(/角煮/i)

  it 'registers a hear listener', ->
    expect(@robot.hear).to.have.been.calledWith(/ピンチ/i)
