'use strict'

describe 'Service: intents', () ->

  # load the service's module
  beforeEach module 'sportsideApp'

  # instantiate service
  intents = {}
  beforeEach inject (_intents_) ->
    intents = _intents_

  it 'should do something', () ->
    expect(!!intents).toBe true
