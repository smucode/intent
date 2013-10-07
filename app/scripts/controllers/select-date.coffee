'use strict'

angular.module('sportsideApp')
  .controller 'SelectDateCtrl', ($scope, intents) ->
    $scope.intent = intents.updateNew()
    $scope.intent.date = 'Today'

    if $scope.intent.type is 'intent'
      $scope.title = "When are you #{$scope.intent.activity}?"
      $scope.sub_title = "I am #{$scope.intent.activity}"
    else
      $scope.title = "When do you want to #{$scope.intent.activity}?"
      $scope.sub_title = "I want to #{$scope.intent.activity}"
