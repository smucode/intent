'use strict'

angular.module('intentApp')
  .controller 'SettingsCtrl', ($scope, user, $location) ->
    $scope.logout = ->
      user.logout()
      $location.path 'login'
