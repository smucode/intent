'use strict'

describe 'Service: jsonStore', () ->

  # load the service's module
  beforeEach module 'sportsideApp'

  # instantiate service
  jsonStore = {}
  beforeEach inject (_jsonStore_) ->
    jsonStore = _jsonStore_

  it 'should do something', () ->
    expect(!!jsonStore).toBe true
