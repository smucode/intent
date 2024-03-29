'use strict'

angular.module('intentApp')
  .directive 'ntMessages', ->
    restrict: 'E'
    templateUrl: 'partials/nt-messages.html'
    controller: ($scope, md5, intentProxy, user) ->

      $scope.postMessage = ->
        ($scope.intent.messages ||= []).unshift
          user: user.toJSON()
          date: new Date
          body: $scope.message

        intentProxy.update $scope.intent, ->

        $scope.message = ''
