'use strict';

angular.module('sportsideApp')
  .controller 'MainCtrl', ($scope, intents) ->

    $scope.formatType = (type) ->
      if type is 'intent' then 'is' else 'wants to'

    $scope.intents = intents.fetch()

    $scope.remove = (id) ->
      intents.remove id
      $scope.intents = intents.fetch()

    # 1. I am / I want to
    # 2. <Activity>
      # I want to <play squash> / Stig Murberg wants to <play squash>
      # I am <playing squash> / Stig Murberg is <playing squash>

    # 4- <Date>
      # I want to <play squash> <today>

    # 3- <Location>
      # I want to <play squash> at <Lysaker Squash>

    # 5- <Other Participants>
      # I am <playing squash> with <Oddiz>

    # 6- Comment
      # Still room in the flight!

    # [ Add Location ]
    # [ All Done ]
