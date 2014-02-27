'use strict'

angular.module('intentApp')
  .controller 'IntentCtrl', ($scope, $routeParams, $location, intents) ->

    intents.read $routeParams.id, (intent) ->
      $scope.intent = intent

    $scope.formatType = (type) ->
      if type is 'intent' then 'is' else 'wants to'

    $scope.del = ->
      intents.remove $scope.intent.id, ->
        $location.path '/'
