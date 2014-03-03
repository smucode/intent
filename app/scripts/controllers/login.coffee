'use strict'

angular.module('intentApp')
  .controller 'LoginCtrl', ($scope, $location, user) ->
    list = -> $location.path 'list'

    if user.id
      return list()

    $scope.user =
      id: user.id

    $scope.login = ->
      user.login $scope.user
      list()
