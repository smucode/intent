'use strict'

angular.module('intentApp')
  .controller 'LoginCtrl', ($scope, $location, user) ->
    list = -> $location.path 'list'    

    user.verify list

    $scope.user = {}
