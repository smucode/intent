'use strict'

describe 'Directive: nt-recents', ->

  elm = undefined
  scope = undefined
  mockRecents = []

  beforeEach module('intentApp')
  beforeEach module('views')
  beforeEach inject ($rootScope, $compile, recents) ->
    spyOn(recents, 'get').andReturn(mockRecents)
    elm = angular.element('<nt-recents header="Foo"></nt-recents>')
    scope = $rootScope
    scope.intent = activity: null
    $compile(elm) scope
    scope.$digest()

  it "should set header", ->
    text = elm.find('div.recents h2').text()
    expect(text).toBe('Foo')


  it 'should fetch recents and put in scope on construct', inject (recents) ->
    expect(recents.get).toHaveBeenCalled()
    expect(scope.recents).toBe(mockRecents)

  it "should render empty if no recents", ->
    expect(elm.find("div.recents").length).toBe 1
    expect(elm.find('div.recents h2.bg2').length).toBe 1
    expect(elm.find('div.recents span').length).toBe 0

  it "should render list of recents", ->
    expect(elm.find("div.recents").length).toBe 1
    expect(elm.find('div.recents h2.bg2').length).toBe 1
    expect(elm.find('div.recents span').length).toBe 0
    scope.$apply ->
      scope.recents = ['foo','bar','baz']

    elms = elm.find('div.recents span')
    expect(elms.length).toBe 3
    expect(elms.eq(0).text().trim()).toBe 'foo'
    expect(elms.eq(1).text().trim()).toBe 'bar'
    expect(elms.eq(2).text().trim()).toBe 'baz'

  it "should assign recents.intent on click", ->
    expect(scope.intent.activity).toBe null

    scope.$apply -> scope.recents = ['foo']

    elm.find('div.recents span').click()

    expect(scope.intent.activity).toBe 'foo'
