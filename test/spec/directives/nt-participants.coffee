'use strict'

describe 'Directive: ntParticipants', () ->

  # load the directive's module
  beforeEach module 'sportsideApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<nt-participants></nt-participants>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the ntParticipants directive'
