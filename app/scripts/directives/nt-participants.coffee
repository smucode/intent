'use strict'

angular.module('intentApp')
  .directive 'ntParticipants', ->
    restrict: 'E'
    templateUrl: 'partials/nt-participants.html'
    controller: ($scope, md5, intentProxy, user) ->

      $scope.join = ->
        ($scope.intent.participants ||= []).push user.toJSON()

        intentProxy.update $scope.intent, ->

      $scope.participantsMessage = (num = 0) ->
        switch num
          when 0 then "Only #{$scope.intent.user.id} is going..."
          when 1 then "#{$scope.intent.user.id} and one more are going."
          else "#{$scope.intent.user.id} and #{num} others are going."
