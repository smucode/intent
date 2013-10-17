'use strict';

angular.module('sportsideApp')
  .controller 'MainCtrl', ($scope, $location, intents) ->

    $scope.formatType = (type) ->
      if type is 'intent' then 'is' else 'wants to'

    $scope.intents = intents.fetch()

    $scope.remove = (id) ->
      intents.remove id
      $scope.intents = intents.fetch()

    $scope.showIntent = (id) ->
      $location.path "intent/#{id}"

    moment.lang 'en', # yeah, not here
        calendar:
            sameDay: '[Today]'
            nextDay: '[Tomorrow]'
            nextWeek: 'dddd'
            sameElse: 'dddd, MMMM Do'

    $scope.formatDate = (date) -> # move to directive or something?
      l8r = moment(date).format('dddd, MMMM Do')
      return 'Today' if l8r is moment().format('dddd, MMMM Do')
      return 'Tomorrow' if l8r is moment().add('days', 1).format('dddd, MMMM Do')
      return moment(date).calendar('dddd')
