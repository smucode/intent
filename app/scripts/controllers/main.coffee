'use strict';

angular.module('sportsideApp')
  .controller 'MainCtrl', ($scope, $location, intents, displayUtil) ->

    $scope.formatType = (type) ->
      if type is 'intent' then 'is' else 'wants to'

    $scope.intents = intents.fetch()

    $scope.showIntent = (id) ->
      $location.path "intent/#{id}"

    moment.lang 'en', # yeah, not here
        calendar:
            sameDay: '[Today]'
            nextDay: '[Tomorrow]'
            nextWeek: 'dddd'
            sameElse: 'dddd, MMMM Do'

    $scope.formatDate = displayUtil.formatDate
