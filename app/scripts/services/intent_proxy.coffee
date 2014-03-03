'use strict'

angular.module('intentApp')
  .factory 'intentProxy', ($q, $http, user, intentGrouper) ->

    list: (success) ->
      $http
        method: 'GET'
        url: "/api/users/#{user.id}/intents"
      .success (intents) ->
        success intentGrouper.group intents

    read: (intentId, success) ->
      $http
        method: 'GET'
        url: "/api/users/#{user.id}/intents/#{intentId}"
      .success success

    create: (intent, success) ->
      intent.user =
        id: user.id
        img: user.img

      $http({
        data: intent
        method: 'POST'
        url: "/api/users/#{user.id}/intents"
      }).success success

    update: (intent, success) ->
      $http({
        data: intent
        method: 'PUT'
        url: "/api/users/#{user.id}/intents/#{intent.id}"
      }).success success

    del: (intentId, success) ->
      $http({
        method: 'DELETE'
        url: "/api/users/#{user.id}/intents/#{intentId}"
      }).success success
