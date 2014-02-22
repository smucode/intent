'use strict';

angular.module('intentApp')
  .directive 'ntTimepicker', () ->
    templateUrl: 'views/nt-timepicker.html'
    restrict: 'E'
    controller: ($scope) ->

      date = moment()
      date.minutes ~(date.minutes() / 15) * -15

      pad = (val) ->
        num = parseInt val, 10
        if num > 9 then num else '0' + num

      update = ->
        $scope.time.hours = pad date.hours()
        $scope.time.minutes = pad date.minutes()

      update()

      $scope.addHour = ->
        date.add 'hour', 1
        update()

      $scope.remHour = ->
        date.add 'hour', -1
        update()

      $scope.addMin = ->
        date.add 'minute', 15
        update()

      $scope.remMin = ->
        date.add 'minute', -15
        update()
