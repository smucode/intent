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

    user.logout = (cb) ->
      $http
        method: 'GET'
        url: "/api/session/logout"
      .success (data) ->
        jsonStore.set 'authenticated_user', null
        cb()

    user.login = (attrs, cb) ->
      attrs.password = '42' # temporary hack until registration and password is implemented
      $http
        method: 'POST'
        data: attrs
        url: "/api/session"
      .success (data) ->
        user.store data
        cb()
      .error ->
        # todo user auth failed, we sould flash error message, but until registration is implemented we simply create the user and redirect
        user.create attrs, cb

    user.create = (attrs, cb) ->
      $http
        method: 'POST'
        data: attrs
        url: "/api/xusers"
      .success (data) ->
        user.store data
        cb()
      .error ->
        # todo flash error message, perhaps with noty or something similar

    user.isLoggedIn = (cb) ->
      $http
        method: 'GET'
        url: "/api/users/me"
      .success (data) ->
        cb()

    user.store = (data) ->
      data.id = data.username # hack to get iuser.id to work. id is reserved in the backend..
      jsonStore.set 'authenticated_user', data

    user
