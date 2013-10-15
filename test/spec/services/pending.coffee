'use strict'

describe 'Service: pendingActivity', () ->

  # load the service's module
  beforeEach module 'sportsideApp'

  # instantiate service
  pendingActivity = {}
  beforeEach inject (_pendingActivity_) ->
    pendingActivity = _pendingActivity_

  it 'should do something', () ->
    expect(!!pendingActivity).toBe true
