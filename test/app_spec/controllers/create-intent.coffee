'use strict'

describe 'Controller: CreateIntentCtrl', () ->

  beforeEach module 'intentApp'

  scope = {}
  createIntentCtrl = {}
  pending = set: ->
  location = path: (@path) ->

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    createIntentCtrl = $controller 'CreateIntentCtrl', {
      pending: pending
      $scope: scope
      $location: location
    }

  it 'should set activity and go to next', ->
    spyOn(scope, 'next')
    expect(scope.intent.activity).not.toBeDefined()
    scope.setActivity('foo');
    expect(scope.intent.activity).toBe('foo')
    expect(scope.next).toHaveBeenCalled()

  it 'should set pending and redirect to select-date', () ->
    spyOn(pending, 'set')
    scope.next()
    expect(pending.set).toHaveBeenCalledWith(scope.intent)
    expect(location.path).toBe('select-date')
