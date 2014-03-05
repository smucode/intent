'use strict'

angular.module('intentApp')
  .directive 'ntParticipants', ->
    restrict: 'E'
    templateUrl: 'partials/nt-participants.html'
    controller: ($scope, md5, intentProxy, user) ->

      $scope.user = user

      updateJoinStatus = ->
        $scope.joined = _.find $scope.intent.participants, (p) ->
          p.id is user.id

      updateJoinStatus()

      $scope.join = ->
        ($scope.intent.participants ||= []).push user.toJSON()
        intentProxy.update $scope.intent, ->
          updateJoinStatus()

      $scope.participantsMessage = (num = 0) ->
        who = if $scope.intent.user.id is user.id then 'You' else $scope.intent.user.id
        switch num
          when 0 then "#{who} are going..."
          when 1 then "#{who} and one more are going."
          else "#{who} and #{num} others are going."
