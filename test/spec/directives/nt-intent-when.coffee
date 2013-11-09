'use strict'

describe 'Directive: ntIntentWhen', () ->

  # load the directive's module
  beforeEach module 'sportsideApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<nt-intent-when></nt-intent-when>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the ntIntentWhen directive'
