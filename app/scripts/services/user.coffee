'use strict'

angular.module('intentApp')
  .factory 'user', ($http, jsonStore) ->
    
    user = 
      data = {}

    user.toJSON = ->
      user.data

    user.logout = (cb) ->
      $http
        method: 'GET'
        url: "/api/session/logout"
      .success (data) ->
        cb()

    user.isLoggedIn = (cb) ->
      $http
        method: 'GET'
        url: "/api/users/me"
      .success (data) ->
        user.data = data
        cb()

    user