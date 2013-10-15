'use strict';

angular.module('sportsideApp')
  .factory 'jsonStore', () ->

    get: (key) ->
      val = localStorage[key]
      try
        JSON.parse val if val
      catch e
        console.warn e

    set: (key, val) ->
      localStorage[key] = JSON.stringify val
