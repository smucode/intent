'use strict'

angular.module('intentApp')
  .factory 'intentProxy', ($q, $http, user, intentGrouper) ->

    list: (success) ->
      userId = user.get()
      $http
        method: 'GET'
        url: "/api/users/#{userId}/intents"
      .success (intents) ->
        success intentGrouper.group intents

    read: (intentId, success) ->
      userId = user.get()
      $http
        method: 'GET'
        url: "/api/users/#{userId}/intents/#{intentId}"
      .success success

    create: (intent, success) ->
      userId = user.get()
      intent.userId = userId
      $http({
        data: intent
        method: 'POST'
        url: "/api/users/#{userId}/intents"
      }).success success

    update: (intent, success) ->
      userId = user.get()
      $http({
        data: intent
        method: 'PUT'
        url: "/api/users/#{userId}/intents/#{intent.id}"
      }).success success

    del: (intentId, success) ->
      userId = user.get()
      $http({
        method: 'DELETE'
        url: "/api/users/#{userId}/intents/#{intentId}"
      }).success success
