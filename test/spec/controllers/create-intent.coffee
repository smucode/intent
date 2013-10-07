'use strict'

describe 'Controller: CreateIntentCtrl', () ->

  # load the controller's module
  beforeEach module 'sportsideApp'

  CreateIntentCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    CreateIntentCtrl = $controller 'CreateIntentCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
