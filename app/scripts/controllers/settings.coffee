'use strict'

angular.module('intentApp')
  .controller 'SettingsCtrl', ($scope, user, $location) ->
    $scope.logout = ->
      user.set(null)
      $location.path 'login'
