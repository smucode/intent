'use strict'

describe 'Directive: gravatar', () ->

  # load the directive's module
  beforeEach module 'intentApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should create img with given hash', inject ($compile) ->
    element = angular.element '<gravatar hash="hash" size="42"></gravatar>'
    element = $compile(element) scope
    expect(element.find('img').attr('src')).toBe 'http://www.gravatar.com/avatar/hash?s=42&d=monsterid'
