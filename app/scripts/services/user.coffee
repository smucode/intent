'use strict'

angular.module('intentApp')
  .factory 'user', (jsonStore) ->
    get: ->
      jsonStore.get 'authenticated_user'

    set: (id) ->
      jsonStore.set 'authenticated_user', id
