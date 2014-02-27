'use strict';

angular.module('intentApp')
  .directive 'ntMenu', () ->
    templateUrl: 'views/nt-menu.html'
    restrict: 'E'
    controller: ($scope, $window, $location) ->

      setClass = (path) ->
        if path is "/list"
          $scope.leftClass = 'menu-icon fa fa-plus-circle fa-2x'
        else
          $scope.leftClass = 'menu-icon fa fa-chevron-left fa-2x'

      $scope.leftClick = ->
        if $location.path() is '/list'
          $location.path 'create'
        else
          $window.history.back()

      $scope.rightClick = ->
        $location.path 'settings'

      $scope.$on '$locationChangeSuccess', (scope, current, previous) ->
        arr = current.split '#'
        setClass arr[1] if arr[1]

      setClass $location.path()
