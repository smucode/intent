'use strict'

angular.module('sportsideApp')
  .controller 'SelectDateCtrl', ($scope, $location, intents, pending) ->
    $scope.intent = pending.get()

    if $scope.intent.type is 'intent'
      $scope.title = "When are you #{$scope.intent.activity}?"
    else
      $scope.title = "When do you want to #{$scope.intent.activity}?"

    $scope.dates = [
      'Today'
      'Tomorrow'
      'Wednesday'
      'Thursday'
      'Friday'
    ]

    $scope.next = (date)->
      $scope.intent.date = date
      pending.set $scope.intent
      $location.path 'select-time'
