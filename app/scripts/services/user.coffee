'use strict'

angular.module('intentApp')
  .factory 'user', ($http, jsonStore) ->
    
    user = {}
    _user = jsonStore.get('authenticated_user')
    unless _.isObject _user then _user = {}

    user.toJSON = ->
      _user

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
        user.store data unless jsonStore.get('authenticated_user')?
        cb()

    user.store = (data) ->
      data.id = data.username # hack to get user.id to work. id is reserved in the backend..
      jsonStore.set 'authenticated_user', data

    _.extend user, _user
