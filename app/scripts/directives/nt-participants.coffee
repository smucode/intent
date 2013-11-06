'use strict'

angular.module('sportsideApp')
  .directive 'ntParticipants', () ->
    templateUrl: 'views/nt-participants.html'
    restrict: 'E'
    controller: ($scope, intents) ->

      $scope.join = ->
        ($scope.intent.messages ||= []).unshift
          date: new Date
          body: 'SMU is tagging along!'

        ($scope.intent.participants ||= []).unshift
          name: 'SMU'

        intents.save $scope.intent

      $scope.participantsMessage = (num = 0) ->
        switch num
          when 0 then 'Nobody has joined yet...'
          when 1 then 'You and one more is going.'
          else "You and #{$scope.intent.participants.length} others are going."
