'use strict'

describe 'Directive: ntIntentDesc', () ->

  # load the directive's module
  beforeEach module 'sportsideApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<nt-intent-desc></nt-intent-desc>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the ntIntentDesc directive'
