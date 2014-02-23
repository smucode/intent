'use strict'

angular.module('intentApp')
  .controller 'LoginCtrl', ($scope, $location, user) ->
    list = -> $location.path 'list'

    if user.get()
      return list()

    $scope.login = ->
      user.set $scope.userId
      list()
