'use strict'

angular.module('intentApp')
  .controller 'SelectTimeCtrl', ($scope, $location, intentProxy, pending) ->
    $scope.intent = pending.get()
    $scope.time = {}

    $scope.next = (time) ->
      $scope.intent.date = moment($scope.intent.date)
        .hour($scope.time.hours)
        .minute($scope.time.minutes)
        .toISOString()

      $scope.intent.time = $scope.time

      pending.set $scope.intent
      $location.path 'select-location'
