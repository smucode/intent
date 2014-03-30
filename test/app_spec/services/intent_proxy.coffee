'use strict'

describe 'Service: intentProxy', () ->

  # load the service's module
  beforeEach module 'intentApp'

  # instantiate service
  scope = null
  httpBackend = null
  intentProxy = null

  beforeEach module ($provide) ->
    $provide.factory 'user', ->
      data =
        id = 'foo'
    $provide.factory 'intentGrouper', ->
      group: (intents) -> intents
    null

  beforeEach inject ($rootScope, $httpBackend, _intentProxy_) ->
    scope = $rootScope.$new()
    httpBackend = $httpBackend
    intentProxy = _intentProxy_

    httpBackend
      .when('GET', '/api/users/foo/intents')
      .respond {foo: 'bar'}

  it 'should list intents', ->
    httpBackend.expect 'GET', '/api/users/foo/intents'

    runs ->
      intentProxy.list (@intents) =>
      scope.$digest()
      httpBackend.flush()

    waitsFor -> @intents

    runs ->
      expect(@intents).toEqual foo: 'bar'

