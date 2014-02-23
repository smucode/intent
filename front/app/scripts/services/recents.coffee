'use strict';

angular.module('intentApp')
  .factory 'recents', (jsonStore) ->

    recent = jsonStore.get('recent') || {}

    get: (type) ->
      recent[type]

    set: (intent) ->
      arr = (recent[intent.type] || []).filter (item) ->
        item isnt intent.activity
      arr.unshift intent.activity
      recent[intent.type] = arr.slice 0, 5
      jsonStore.set 'recent', recent
