'use strict'

angular.module('sportsideApp')
  .controller 'SelectDateCtrl', ($scope, $location, intents, pending) ->
    $scope.intent = pending.get()

    if $scope.intent.type is 'intent'
      $scope.title = "When are you #{$scope.intent.activity}?"
    else
      $scope.title = "When do you want to #{$scope.intent.activity}?"

    $scope.dates = [0...7].map (i) ->
      m = moment().add('days', i)
      id: m.toISOString()
      day: switch i
        when 0 then 'Today'
        when 1 then 'Tomorrow'
        else m.format('dddd')

    $scope.next = (date)->
      $scope.intent.date = date
      pending.set $scope.intent
      $location.path 'select-time'
