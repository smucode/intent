'use strict'

angular.module('intentApp')
  .controller 'SelectDateCtrl', ($scope, $location, pending) ->
    $scope.intent = pending.get()

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
