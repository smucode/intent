'use strict';

angular.module('intentApp')
  .controller 'MainCtrl', ($scope, $location, intents, displayUtil) ->

    $scope.formatType = (type) ->
      if type is 'intent' then 'is' else 'wants to'

    $scope.intents = intents.fetch()

    $scope.showIntent = (id) ->
      $location.path "intent/#{id}"

    $scope.formatDate = displayUtil.formatDate
