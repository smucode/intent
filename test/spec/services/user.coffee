'use strict'

describe 'Service: User', () ->
  beforeEach module 'intentApp'

  beforeEach module ($provide) ->
    $provide.factory 'jsonStore', ->
      get: () -> @id
      set: (key, @id) ->
    null

  user = {}
  beforeEach inject (_user_) ->
    user = _user_

  assert = chai.assert

  it 'should return user id if user is found', ->
    user.set('foo')
    assert.equal user.get(), 'foo'
