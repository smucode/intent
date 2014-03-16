'use strict'

angular.module('intentApp')
  .factory 'user', ($http, jsonStore) ->

    user = {}
    $http
      method: 'GET'
      url: "/api/users/me"
    .success (data) ->
        user= data

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
