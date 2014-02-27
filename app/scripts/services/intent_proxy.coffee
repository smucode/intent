'use strict'

angular.module('intentApp')
  .factory 'intentProxy', () ->

    # get   '/user/<username>/intents'
    # post: '/user/<username>/intents'
    # put:  '/user/<username>/intents/<id>'
    # del:  '/user/<username>/intents/<id>'

    map = {}

    ___reset: ->
      map = {}

    get: (userId, callback) ->
      callback _.values(map)

    post: (userId, intent, callback) ->
      intent.id = (Math.random() * 100000).toString(16)
      map[intent.id] = intent
      callback intent

    put: (userId, intent, callback) ->
      map[intent.id] = intent
      callback intent

    del: (userId, intentId, callback) ->
      delete map[intentId]
      callback()
