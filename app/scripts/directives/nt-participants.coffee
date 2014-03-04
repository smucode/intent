'use strict'

angular.module('intentApp')
  .directive 'ntParticipants', ->
    restrict: 'E'
    templateUrl: 'partials/nt-participants.html'
    controller: ($scope, md5, intentProxy, user) ->

      $scope.join = ->
        ($scope.intent.participants ||= []).unshift user.toJSON()

        intentProxy.update $scope.intent, ->

      $scope.participantsMessage = (num = 0) ->
        switch num
          when 0 then 'Nobody has joined yet...'
          when 1 then 'You and one more is going.'
          else "You and #{$scope.intent.participants.length} others are going."
