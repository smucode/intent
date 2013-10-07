'use strict'

angular.module('sportsideApp')
  .controller 'SelectActivityCtrl', ($scope, intents) ->
    $scope.intent = intents.updateNew()

    if $scope.intent.type is 'intent'
      $scope.title = 'What are you doing?'
      $scope.sub_title = 'I am'
    else
      $scope.title = 'What do you want to do?'
      $scope.sub_title = 'I want to'
