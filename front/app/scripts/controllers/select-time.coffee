'use strict'

angular.module('intentApp')
  .controller 'SelectTimeCtrl', ($scope, $location, intents, pending) ->
    $scope.intent = pending.get()
    $scope.time = {}

    if $scope.intent.type is 'intent'
      $scope.title = "What time are you #{$scope.intent.activity}?"
    else
      $scope.title = "What time do you want to #{$scope.intent.activity}?"

    $scope.next = (time) ->
      $scope.intent.date = moment($scope.intent.date)
        .hour($scope.time.hours)
        .minute($scope.time.minutes)
        .toISOString()

      $scope.intent.time = $scope.time
      intents.save $scope.intent
      $location.path '/'
