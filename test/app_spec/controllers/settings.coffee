'use strict'

describe 'Controller: SettingsCtrl', () ->

  beforeEach module 'intentApp'

  scope = {}
  SettingsCtrl = {}
  user = logout: ->
  location = path: (@path) ->

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    SettingsCtrl = $controller 'SettingsCtrl', {
      user: user
      $scope: scope
      $location: location
    }

  it 'should log out the authenticated user', () ->
    spyOn user, 'logout'
    scope.logout()
    expect(user.logout).toHaveBeenCalled()
    user.logout.mostRecentCall.args[0]()
    expect(location.path).toBe('/login')
