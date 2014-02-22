'use strict';

angular.module('intentApp')
  .factory 'jsonStore', () ->

    get: (key) ->
      val =
      try
        JSON.parse val if val
      catch e
        console.warn e

    set: (key, val) ->
      localStorage[key] = JSON.stringify val
