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

  assert = chai.assert

  it 'set pending and redirect to select-activity', () ->
    spyOn pending, 'set'
    
    scope.create('foo')
    expect(pending.set).toHaveBeenCalled()
    expect(pending.set.calls[0].args[0].type).toBe('foo')
    assert.equal location.path, 'select-activity'
