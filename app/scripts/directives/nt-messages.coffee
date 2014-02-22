'use strict'

angular.module('intentApp')
  .directive 'ntMessages', ->
    restrict: 'E'
    templateUrl: 'views/nt-messages.html'
    controller: ($scope, intents) ->

      $scope.postMessage = ->
        ($scope.intent.messages ||= []).unshift
          date: new Date
          body: $scope.message
        intents.save $scope.intent
        $scope.message = ''
