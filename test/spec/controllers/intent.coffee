'use strict'

describe 'Controller: IntentCtrl', () ->

  # load the controller's module
  beforeEach module 'sportsideApp'

  IntentCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    IntentCtrl = $controller 'IntentCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
