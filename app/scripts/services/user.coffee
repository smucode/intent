'use strict'

angular.module('intentApp')
  .factory 'user', (jsonStore) ->

    # this crazy ass pattern is probably not a great idea...

    user = jsonStore.get('authenticated_user')
    unless _.isObject user then user = {}


    user.toJSON = ->
      u = {}
      for key, val of user
        unless key is 'login' or key is 'logout' or key is 'toJSON'
          u[key] = val
      u

    user.logout = ->
      for key, val of user
        unless key is 'login' or key is 'logout' or key is 'toJSON'
          delete user[key]

    user.login = (attrs) ->
      for key, val of attrs
        unless key is 'login' or key is 'logout' or key is 'toJSON'
          user[key] = val
      jsonStore.set 'authenticated_user', attrs

    user
