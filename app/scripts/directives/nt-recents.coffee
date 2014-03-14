'use strict'

angular.module('intentApp')
  .directive 'ntRecents', ->
    templateUrl: 'partials/nt-recents.html'
    restrict: 'E'
    controller: ($scope, recents, $attrs) ->
      $scope.recents = recents.get()
      $scope.header = $attrs.header
      $scope.recentSelected = (recent) ->
        $scope.intent.activity = recent
