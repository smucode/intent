'use strict'

angular.module('intentApp')
  .controller 'IntentCtrl', ($scope, $location, intentProxy, intent) ->

    $scope.intent = intent

    $scope.formatType = (type) ->
      if type is 'intent' then 'is' else 'wants to'

    $scope.del = ->
      intentProxy.del $scope.intent.id, ->
        $location.path '/'
