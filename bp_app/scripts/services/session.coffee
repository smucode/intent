'use strict'

angular.module('angularFullstackApp')
  .factory 'Session', ($resource) ->
    $resource '/api/session/'
