'use strict'

angular.module('intentApp')
  .controller 'SelectActivityCtrl', ($scope, $location, pending, recents) ->

    $scope.intent = pending.get()

    $scope.recent = recents.get $scope.intent.type

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
      pending.set $scope.intent
      $location.path 'select-date'
