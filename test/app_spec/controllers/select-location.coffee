'use strict'

describe 'Controller: SelectLocationCtrl', () ->

  beforeEach module 'intentApp'

  scope = {}
  mockIntent =
    activity: 'coffee and hax'
  selectLocationCtrl = {}
  pending = get: ->
    mockIntent
  recents = set: (intent) ->
  location = path: (@path) ->
  intentProxy = create: (intent, cb) ->
    cb()

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    selectLocationCtrl = $controller 'SelectLocationCtrl', {
      pending: pending
      recents: recents
      $scope: scope
      $location: location
      intentProxy: intentProxy
    }

  it 'should set intent and label to scope on construct', ->
    expect(scope.intent).toBe mockIntent
    expect(scope.label).toBe 'What are you doing?'

  it 'should set recents in create success callback', ->
    runs ->
      spyOn(recents, 'set')
      spyOn(intentProxy, 'create').andCallThrough()
      scope.next()
      expect(intentProxy.create).toHaveBeenCalled()
      expect(intentProxy.create.calls[0].args[0]).toBe mockIntent
      expect(recents.set).toHaveBeenCalledWith('intent.location', mockIntent.location)



