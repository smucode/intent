'use strict'

FB = FB or { ui: -> } # i feel so dirty..

describe 'Directive: fbinvite', () ->

  # load the directive's module
  beforeEach module 'intentApp'


  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should create link which calls FB api when clicked', inject ($compile) ->
    spyOn(FB, 'ui').andCallFake (data, db) ->
    element = angular.element "<fbinvite></fbinvite>"
    scope.intent = 
      id: '42'
      activity: "party"
      location: "basement"
      date: "tomorrow"
      time: "13:37"
    element = $compile(element) scope
    expect(element.text()).toBe 'invite some friends'
    expect(FB.ui).not.toHaveBeenCalled()
    element.click()
    expect(FB.ui).toHaveBeenCalled()
    arg = FB.ui.calls[0].args[0]
    expect(arg.method).toBe('apprequests')
    expect(arg.message).toBe('I intend to party. Join me! http://intentapp.herokuapp.com/#/intent/42/rsvp')

