'use strict'

angular.module('sportsideApp')
  .controller 'CreateIntentCtrl', ($scope, intents) ->
    $scope.create = (type) ->
      intents.createNew().type = type
