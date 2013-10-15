'use strict'

angular.module('sportsideApp')
  .controller 'CreateIntentCtrl', ($scope, $location, intents) ->
    $scope.create = (type) ->

      intents.intent().type = type

      $location.path 'select-activity'
