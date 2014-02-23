'use strict'

describe 'Directive: nt-menu', () ->

  # load the directive's module
  beforeEach module 'intentApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'navigate to settings when right button is clicked', inject ($compile) ->
    element = angular.element '<nt-menu></nt-menu>'
    element = $compile(element) scope

    # smu could not figure out how to test directives...

    # expect(element.text()).toBe 'this is the test directive'
