'use strict'

describe 'Controller: SelectDateCtrl', () ->

  # load the controller's module
  beforeEach module 'sportsideApp'

  SelectDateCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    SelectDateCtrl = $controller 'SelectDateCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
