'use strict'

describe 'Controller: LoginCtrl', () ->

  # load the controller's module
  beforeEach module 'intentApp'

  LoginCtrl = {}

  scope = {}
  user =
    get: ->
    set: (@id) ->
  location = path: (@path) ->

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    LoginCtrl = $controller 'LoginCtrl', {
      user: user
      $scope: scope
      $location: location
    }

  assert = chai.assert

  it 'should set user and redirect', () ->
    scope.userId = 'foo'
    scope.login()
    assert.equal user.id, 'foo'
    assert.equal location.path, 'list'

