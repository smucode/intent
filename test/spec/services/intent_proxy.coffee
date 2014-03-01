'use strict'

describe 'Service: intentProxy', () ->

  # load the service's module
  beforeEach module 'intentApp'

  # instantiate service
  intentProxy = {}
  httpBackend = null

  beforeEach module ($provide) ->
    $provide.factory 'user', ->
      get: -> 'foo'
    null

  beforeEach inject (_intentProxy_, $httpBackend) ->
    intentProxy = _intentProxy_
    httpBackend = $httpBackend
    httpBackend
      .when('GET', '/api/users/foo/intents')
      .respond {foo: 'bar'}

  # it 'should list intents', ->
  #   httpBackend.expect 'GET', '/api/users/foo/intents'

  #   runs -> intentProxy.list (@intents) =>
  #   waitsFor -> @intents
  #   runs -> expect(@intents).toEqual foo: 'bar'

  #   httpBackend.flush()
