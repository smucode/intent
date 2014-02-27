'use strict'

angular.module('intentApp')
  .controller 'CreateIntentCtrl', ($scope, $location, pending) ->

    $scope.create = (type) ->
      pending.set
        type: type

      $location.path 'select-activity'
