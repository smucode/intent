'use strict'

angular.module('intentApp')
  .controller 'IntentCtrl', ($scope, $location, intents, intent) ->

    $scope.intent = intent.data

    $scope.formatType = (type) ->
      if type is 'intent' then 'is' else 'wants to'

    $scope.del = ->
      intents.remove $scope.intent.id, ->
        $location.path '/'
