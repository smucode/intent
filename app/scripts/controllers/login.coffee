'use strict'

angular.module('intentApp')
  .controller 'LoginCtrl', ($scope, $location, user) ->
    list = -> $location.path 'list'    

    user.isLoggedIn list

    $scope.user = {}

    $scope.login = ->
      user.login $scope.user, list
