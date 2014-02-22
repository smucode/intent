'use strict'

angular.module('intentApp')
  .factory 'user', (jsonStore) ->
    console.log jsonStore.get 'sdlkj'
    # Service logic
    # ...

    meaningOfLife = 42

    # Public API here
    {
      get: () ->
        null
    }
