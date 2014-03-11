'use strict'

angular.module('intentApp')
  .controller 'SelectLocationCtrl', ($scope, $location, pending, recents, intentProxy) ->

    $scope.intent = pending.get()
    $scope.label = 'What are you doing?'

    $scope.setLocation = (location) ->
      $scope.intent.location = location
      $scope.next()

    $scope.next = ->
      intentProxy.create $scope.intent, ->
        recents.set $scope.intent
        $location.path '/'
