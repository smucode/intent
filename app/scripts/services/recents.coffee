'use strict';

angular.module('intentApp')
  .factory 'recents', (jsonStore) ->

    recent = jsonStore.get('recent') || []

    get: () ->
      recent

    set: (intent) ->
      arr = (recent || []).filter (item) ->
        item isnt intent.activity
      arr.unshift intent.activity
      recent = arr.slice 0, 5
      jsonStore.set 'recent', recent
