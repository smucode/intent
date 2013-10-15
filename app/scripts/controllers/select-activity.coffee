'use strict'

angular.module('sportsideApp')
  .controller 'SelectActivityCtrl', ($scope, $location, intents) ->

    $scope.intent = intents.intent()

    $scope.recent = intents.recent $scope.intent.type

    if $scope.intent.type is 'intent'
      $scope.title = 'What are you doing?'
      $scope.subTitle = 'I am'
    else
      $scope.title = 'What do you want to do?'
      $scope.subTitle = 'I want to'

    $scope.setActivity = (activity) ->
      $scope.intent.activity = activity
      $scope.next()

    $scope.next = ->
      $location.path 'select-date'
