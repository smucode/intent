'use strict'

angular.module('sportsideApp')
  .controller 'IntentCtrl', ($scope, $routeParams, $location, intents) ->

    $scope.intent = intents.byId $routeParams.id

    $scope.formatType = (type) ->
      if type is 'intent' then 'is' else 'wants to'

    $scope.postMessage = ->
      ($scope.intent.messages ||= []).unshift
        date: new Date
        body: $scope.message
      intents.save $scope.intent
      $scope.message = ''

    $scope.del = ->
      intents.remove $scope.intent.id
      $location.path '/'
