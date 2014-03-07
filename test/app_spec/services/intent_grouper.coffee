'use strict'

describe 'Service: intentGrouper', () ->

  # load the service's module
  beforeEach module 'intentApp'

  # instantiate service
  intentGrouper = {}
  beforeEach inject (_intentGrouper_) ->
    intentGrouper = _intentGrouper_

  it 'should do something', () ->
    expect(!!intentGrouper).toBe true
