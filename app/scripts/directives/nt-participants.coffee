'use strict'

angular.module('intentApp')
  .directive 'ntParticipants', ->
    restrict: 'E'
    templateUrl: 'partials/nt-participants.html'
    controller: ($scope, intentProxy, user) ->

      $scope.join = ->
        ($scope.intent.messages ||= []).unshift
          date: new Date
          body: user.get() + ' is tagging along!'

        ($scope.intent.participants ||= []).unshift
          name: user.get()

        intentProxy.update $scope.intent, ->

      $scope.participantsMessage = (num = 0) ->
        switch num
          when 0 then 'Nobody has joined yet...'
          when 1 then 'You and one more is going.'
          else "You and #{$scope.intent.participants.length} others are going."
