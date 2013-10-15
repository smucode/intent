'use strict'

angular.module('sportsideApp')
  .controller 'CreateIntentCtrl', ($scope, $location, pending) ->

    $scope.create = (type) ->
      pending.set
        type: type

      $location.path 'select-activity'
