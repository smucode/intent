'use strict'

angular.module('intentApp')
  .controller 'LoginCtrl', ($scope, $location, user) ->
    list = -> $location.path 'list'

    if user.id
      return list()

    $scope.user =
      id: user.id
      img: 'https://0.gravatar.com/avatar/c15e0631260e58737ced89e685ced034'

    $scope.login = ->
      user.login $scope.user
      list()
