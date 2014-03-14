'use strict';

angular.module('intentApp')
  .factory 'recents', (jsonStore) ->
    storeName = 'recents'

    recents = jsonStore.get(storeName) || {}
    if _.isArray recents then recents = {}

    get: (key) ->
      recents[key]

    set: (key, val) ->
      arr = recents[key] || []
      arr.unshift(val) unless ~arr.indexOf(val)
      arr = arr.slice 0, 5
      recents[key] = arr
      jsonStore.set storeName, recents
