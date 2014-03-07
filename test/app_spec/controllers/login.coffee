'use strict'

describe 'Controller: LoginCtrl', () ->

  # load the controller's module
  beforeEach module 'intentApp'

  LoginCtrl = {}

  scope = {}
  user = login: (@attrs) ->
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
    scope.user =
      id: 'foo'
      img: 'bar'
    scope.login()
    assert.equal user.attrs.id, 'foo'
    assert.equal user.attrs.img, 'bar'
    assert.equal location.path, 'list'

