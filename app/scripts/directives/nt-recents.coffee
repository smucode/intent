'use strict'

angular.module('intentApp')
  .directive 'ntRecents', ->
    templateUrl: 'partials/nt-recents.html'
    restrict: 'E'
    controller: ($scope, recents) ->
      $scope.recents = recents.get()

