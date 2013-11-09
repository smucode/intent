'use strict'

describe 'Service: Displayutil', () ->

  # load the service's module
  beforeEach module 'SportsideApp'

  # instantiate service
  Displayutil = {}
  beforeEach inject (_Displayutil_) ->
    Displayutil = _Displayutil_

  it 'should do something', () ->
    expect(!!Displayutil).toBe true
