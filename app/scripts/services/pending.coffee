'use strict';

angular.module('intentApp')
  .factory 'pending', (jsonStore) ->

    get: ->
      jsonStore.get 'pending'

    set: (pending) ->
      jsonStore.set 'pending', pending

    upd: (partial) ->
      @set _.extend @get(), partial
