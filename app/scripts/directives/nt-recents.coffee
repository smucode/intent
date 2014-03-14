'use strict'

angular.module('intentApp')
  .directive 'ntRecents', ->
    templateUrl: 'partials/nt-recents.html'
    restrict: 'E'
    controller: ($scope, recents, $attrs) ->
      $scope.recents = recents.get $attrs.attr
      $scope.header = $attrs.header

      $scope.recentSelected = (recent) ->
        target = $scope
        attrs = $attrs.attr.split '.'
        while rest = attrs.shift()
          if attrs.length
            target = target[rest]
          else
            target[rest] = recent
