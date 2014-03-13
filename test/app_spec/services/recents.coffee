'use strict'

describe 'Service: recents', () ->

  # load the service's module
  beforeEach module 'intentApp'

  # instantiate service
  key = null
  val = null
  recents = null

  beforeEach module ($provide) ->
    arr = []
    $provide.factory 'jsonStore', ->
      get: (k) -> ['foo']
      set: (k, v) ->
        key = k
        val = v
    null

  beforeEach inject (_recents_) ->
    recents = _recents_

  it 'gets on initialize', ->
    expect(recents.get()).toEqual ['foo']

  it 'sets and gets', ->
    recents.set activity: 'bar'
    expect(recents.get()).toEqual ['bar', 'foo']
