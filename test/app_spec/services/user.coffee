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
    # user.login
    #   foo: 'bar'
    #   baz: 'qux'

    # assert.equal user.foo, 'bar'
    # assert.equal user.baz, 'qux'

    # user.logout()

    # assert.equal user.foo, undefined
    # assert.equal user.baz, undefined
