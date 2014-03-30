'use strict'

describe 'Controller: LoginCtrl', () ->

  # load the controller's module
  beforeEach module 'intentApp'

  LoginCtrl = {}

  scope = {}
  controller = ->
  user = verify: (cb) -> 
  location = path: (@path) ->

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    controller = $controller
    scope = $rootScope.$new()
    
  it 'should verify user redirect on construct', () ->
    spyOn(user, 'verify')
    spyOn(location, 'path')
    LoginCtrl = controller 'LoginCtrl', {
      user: user
      $scope: scope
      $location: location
    }
    expect(user.verify).toHaveBeenCalled()
    user.verify.mostRecentCall.args[0]()
    expect(location.path).toHaveBeenCalledWith('list')

