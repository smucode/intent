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

    create: (intent, callback) ->
      userId = user.get()
      $http({
        data: intent
        method: 'POST'
        url: "/api/users/#{userId}/intents"
      }).success (data) -> callback data

    update: (intent, callback) ->
      userId = user.get()
      $http({
        data: intent
        method: 'PUT'
        url: "/api/users/#{userId}/intents/#{intent.id}"
      }).success (data) -> callback data

    del: (intentId, callback) ->
      userId = user.get()
      $http({
        method: 'DELETE'
        url: "/api/users/#{userId}/intents/#{intentId}"
      }).success callback
