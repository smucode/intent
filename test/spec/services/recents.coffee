'use strict'

describe 'Service: recents', () ->

  # load the service's module
  beforeEach module 'sportsideApp'

  # instantiate service
  recents = {}
  beforeEach inject (_recents_) ->
    recents = _recents_

  it 'should do something', () ->
    expect(!!recents).toBe true
