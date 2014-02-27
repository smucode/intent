'use strict'

describe 'Controller: SettingsCtrl', () ->

  beforeEach module 'intentApp'

  scope = {}
  SettingsCtrl = {}
  user =
    get: ->
    set: (@id) ->
  location = path: (@path) ->

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    SettingsCtrl = $controller 'SettingsCtrl', {
      user: user
      $scope: scope
      $location: location
    }

  assert = chai.assert

  it 'should log out the authenticated user', () ->
    scope.logout()
    assert.equal user.id, null
    assert.equal location.path, 'login'
