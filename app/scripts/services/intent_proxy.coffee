'use strict'

angular.module('intentApp')
  .factory 'intentProxy', ($http) ->

    list: (userId, callback) ->
      $http({method: 'GET', url: "/api/users/#{userId}/intents"})
        .success (data) ->
          callback data

    read: (userId, intentId, callback) ->
      $http({method: 'GET', url: "/api/users/#{userId}/intents/#{intentId}"})
        .success (data) ->
          callback data

    create: (userId, intent, callback) ->
      $http({
        data: intent
        method: 'POST'
        url: "/api/users/#{userId}/intents"
      }).success (data) -> callback data

    update: (userId, intent, callback) ->
      $http({
        data: intent
        method: 'PUT'
        url: "/api/users/#{userId}/intents/#{intent.id}"
      }).success (data) -> callback data

    del: (userId, intentId, callback) ->
      $http({
        method: 'DELETE'
        url: "/api/users/#{userId}/intents/#{intentId}"
      }).success callback
