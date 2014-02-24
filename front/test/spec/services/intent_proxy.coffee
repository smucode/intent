'use strict'

describe 'Service: intentProxy', () ->

  # load the service's module
  beforeEach module 'intentApp'

  # instantiate service
  intentProxy = {}
  beforeEach inject (_intentProxy_) ->
    intentProxy = _intentProxy_
    intentProxy.___reset()

  it 'should not contain any intents', ->
    runs ->
      intentProxy.get 'foo', (@intents) =>

    waitsFor -> @intents

    runs ->
      expect(@intents.length).toBe 0

  it 'should create and fetch intent', ->
    runs ->
      intentProxy.post 'foo', {foo: 'bar'}, (@intent) =>

    waitsFor -> @intent

    runs ->
      expect(@intent.id).toBeTruthy()
      intentProxy.get 'foo', (@intents) =>

    waitsFor -> @intents

    runs ->
      expect(@intents.length).toBe 1
      expect(@intents[0].id).toBeTruthy()
      expect(@intents[0].foo).toBe 'bar'

  it 'should update intents', ->
    runs ->
      intentProxy.put 'foo', {foo: 'qux'}, (@intent) =>

    waitsFor -> @intent

    runs ->
      expect(@intent.foo).toBe 'qux'
      intentProxy.get 'foo', (@intents) =>

    waitsFor -> @intents

    runs ->
      expect(@intents.length).toBe 1

  it 'should delete intents', ->
    runs ->
      intentProxy.post 'foo', {foo: 'bar'}, (@intent) =>

    waitsFor -> @intent

    runs ->
      expect(@intent.id).toBeTruthy()
      intentProxy.del 'foo', @intent.id, () =>
        @deleted = true

    waitsFor -> @deleted

    runs ->
      intentProxy.get 'foo', (@intents) =>

    waitsFor -> @intents

    runs ->
      expect(@intents.length).toBe 0
