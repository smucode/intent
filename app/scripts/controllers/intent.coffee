'use strict'

angular.module('sportsideApp')
  .controller 'IntentCtrl', ($scope, $routeParams, intents) ->

    $scope.intent = intents.byId $routeParams.id
