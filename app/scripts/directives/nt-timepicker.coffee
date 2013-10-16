'use strict';

angular.module('sportsideApp')
  .directive 'ntTimepicker', () ->
    templateUrl: 'views/nt-timepicker.html'
    restrict: 'E'
    controller: ($scope) ->

      pad = (val) ->
        num = parseInt val, 10
        if num > 9 then num else '0' + num

      next = (val, op, max) ->
        num = parseInt val
        if op is '+'
          if num is max then pad 0 else pad num + 1
        else
          if num is 0 then pad max else pad num - 1

      date = new Date()
      $scope.time.hours = pad date.getHours()
      $scope.time.minutes = pad date.getMinutes()

      $scope.addHour = ->
        $scope.time.hours = next $scope.time.hours, '+', 23

      $scope.remHour = ->
        $scope.time.hours = next $scope.time.hours, '-', 23

      $scope.addMin = ->
        $scope.time.minutes = next $scope.time.minutes, '+', 59

      $scope.remMin = ->
        $scope.time.minutes = next $scope.time.minutes, '-', 59
