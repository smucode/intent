'use strict'

angular.module('intentApp')
  .factory 'user', ($http, jsonStore) ->
    
    user = jsonStore.get('authenticated_user')
    unless _.isObject user then user = {}

    user.toJSON = ->
      u = {}
      for key, val of user
        unless key is 'login' or key is 'logout' or key is 'toJSON'
          u[key] = val
      u

    user.logout = ->
      $http
        method: 'DEL'
        url: "/api/session"
      .success ->

    user.login = (attrs) ->
      $http
        method: 'POST'
        url: "/api/session"
      .success (data) ->
        jsonStore.set 'authenticated_user', data

    user
