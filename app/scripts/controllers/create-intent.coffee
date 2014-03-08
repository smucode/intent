'use strict'

angular.module('intentApp')
  .controller 'CreateIntentCtrl', ($scope, $location, pending) ->

    # $scope.recent = recents.get()

    $scope.intent = {}
    $scope.title = 'I am'
    $scope.label = 'What are you doing?'

    $scope.setActivity = (activity) ->
      $scope.intent.activity = activity
      $scope.next()

    $scope.next = ->
      pending.set $scope.intent
      $location.path 'select-date'
