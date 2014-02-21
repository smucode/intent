'use strict'

angular.module('sportsideApp')
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
