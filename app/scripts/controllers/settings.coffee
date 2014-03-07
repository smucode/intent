'use strict'

angular.module('intentApp')
  .controller 'SettingsCtrl', ($scope, user, $location) ->
    $scope.logout = ->
      user.logout()
      $location.path 'login'

    $scope.login = (id, email) ->
      id ||= (Math.random() * 100000 | 0).toString(16)
      email ||= Math.random() * 100000 | 0
      user.login
        id: id
        email: email
      $location.path '/'
