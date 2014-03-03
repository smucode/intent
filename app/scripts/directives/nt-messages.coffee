'use strict'

angular.module('intentApp')
  .directive 'ntMessages', ->
    restrict: 'E'
    templateUrl: 'partials/nt-messages.html'
    controller: ($scope, intentProxy, user) ->

      $scope.postMessage = ->
        ($scope.intent.messages ||= []).unshift
          user:
            id: user.id
            img: user.img
          date: new Date
          body: $scope.message

        intentProxy.update $scope.intent, ->

        $scope.message = ''
