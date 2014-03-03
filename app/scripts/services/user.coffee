'use strict'

angular.module('intentApp')
  .factory 'user', (jsonStore) ->
    user = jsonStore.get('authenticated_user') || {}

    user.logout = ->
      for key, val of user
        unless key is 'login' or key is 'logout'
          delete user[key]

    user.login = (attrs) ->
      for key, val of attrs
        unless key is 'login' or key is 'logout'
          user[key] = val
      jsonStore.set 'authenticated_user', attrs

    user
