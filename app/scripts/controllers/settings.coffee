'use strict'

angular.module('intentApp')
  .controller 'SettingsCtrl', ($scope, user, $location) ->
    $scope.logout = ->
      user.logout()
      $location.path 'login'

    $scope.login = (id, email) ->
      user.login
        id: id
        email: email
      $location.path '/'
