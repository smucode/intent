'use strict'

angular.module('sportsideApp')
  .controller 'IntentCtrl', ($scope, $routeParams, $location, intents) ->

    $scope.intent = intents.byId $routeParams.id

    $scope.participantsMessage = (num = 1) ->
      switch num
        when 1 then 'Only you are going'
        when 2 then 'You and one more is going'
        else "You and #{$scope.intent.participants.length} others are going"

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

    $scope.join = ->
      ($scope.intent.messages ||= []).unshift
        date: new Date
        body: 'SMU is tagging along!'

      ($scope.intent.participants ||= []).unshift
        name: 'SMU'

      intents.save $scope.intent
