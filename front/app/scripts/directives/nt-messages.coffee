'use strict'

angular.module('intentApp')
  .directive 'ntMessages', ->
    restrict: 'E'
    templateUrl: 'views/nt-messages.html'
    controller: ($scope, intents, user) ->

      $scope.postMessage = ->
        ($scope.intent.messages ||= []).unshift
          name: user.get()
          date: new Date
          body: $scope.message
        intents.save $scope.intent
        $scope.message = ''
