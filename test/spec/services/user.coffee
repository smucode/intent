'use strict'

describe 'Service: User', () ->

  # load the service's module
  beforeEach module 'sportsideApp'

  # instantiate service
  user = {}
  beforeEach inject (_user_) ->
    user = _user_

  assert = chai.assert

  it 'should return null if user not found', () ->
    assert.equal user.get('foo'), null

  # it 'should return user id if user is found', () ->
  #   assert.equal user.get('foo'), null
