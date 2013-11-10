'use strict';

angular.module('sportsideApp')
  .directive 'ntMenu', () ->
    templateUrl: 'views/nt-menu.html'
    restrict: 'E'
    controller: ($scope, $window, $location) ->

      setClass = (path) ->
        if path is "/"
          $scope.leftClass = 'menu-icon fa fa-plus-circle fa-2x'
        else
          $scope.leftClass = 'menu-icon fa fa-chevron-left fa-2x'

      $scope.leftClick = ->
        if $location.path() is '/'
          $location.path('create')
        else
          $window.history.back()

      $scope.$on '$locationChangeSuccess', (scope, current, previous) ->
        arr = current.split '#'
        setClass arr[1] if arr[1]

      setClass $location.path()
