'use strict';

angular.module('sportsideApp')
  .factory 'jsonIdStore', (jsonStore) ->
    init: (key) ->
      cache = jsonStore.get(key) or {}

      save = ->
        jsonStore.set key, cache

      all: ->
        _.values cache

      get: (id) ->
        cache[id]

      rem: (id) ->
        delete cache[id]
        save()

      save: (item) ->
        unless item.id
          item.id = (Math.random() * 100000 | 0).toString 16
        cache[item.id] = item
        save()
