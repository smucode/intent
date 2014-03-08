'use strict';

angular.module('intentApp')
  .controller 'MainCtrl', ($scope, $location, md5, intentProxy, displayUtil) ->

    intentProxy.list (intents) ->
      $scope.intents = intents

    $scope.showIntent = (id) ->
      $location.path "intent/#{id}"

    $scope.formatDate = displayUtil.formatDate
