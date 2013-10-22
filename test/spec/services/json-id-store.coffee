'use strict'

describe 'Service: jsonIdStore', () ->

  # load the service's module
  beforeEach module 'sportsideApp'

  # instantiate service
  jsonIdStore = {}
  beforeEach inject (_jsonIdStore_) ->
    jsonIdStore = _jsonIdStore_

  it 'should do something', () ->
    expect(!!jsonIdStore).toBe true
