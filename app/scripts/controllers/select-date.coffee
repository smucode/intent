'use strict'

angular.module('sportsideApp')
  .controller 'SelectDateCtrl', ($scope, intents) ->
    $scope.intent = intents.intent()

    if $scope.intent.type is 'intent'
      $scope.title = "When are you #{$scope.intent.activity}?"
      $scope.sub_title = "I am #{$scope.intent.activity}"
    else
      $scope.title = "When do you want to #{$scope.intent.activity}?"
      $scope.sub_title = "I want to #{$scope.intent.activity}"

    $scope.dates = [
      'Today'
      'Tomorrow'
      'Wednesday'
      'Thursday'
      'Friday'
    ]

    $scope.save = (date)->
      $scope.intent.date = date
      intents.save $scope.intent
