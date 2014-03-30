'use strict'

describe 'Directive: fbavatar', () ->

  # load the directive's module
  beforeEach module 'intentApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should create img with given username', inject ($compile) ->
    element = angular.element '<fbavatar uname="kenglxn"></fbavatar>'
    element = $compile(element) scope
    expect(element.find('img').attr('src')).toBe 'http://graph.facebook.com/kenglxn/picture'
