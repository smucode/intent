'use strict';

angular.module('sportsideApp')
  .controller 'MainCtrl', ($scope, intents) ->

    $scope.intents = intents.fetch()

    # 1. I am / I want to
    # 2. <Activity>
      # I want to <play squash> / Stig Murberg wants to <play squash>
      # I am <playing squash> / Stig Murberg is <playing squash>
    # 3- <Location>
      # I want to <play squash> at <Lysaker Squash>
    # 4- <Date>
      # I want to <play squash> at <Lysaker Squash>, <today>
    # 5- <Other Participants>
      # I am <playing squash> with <Oddiz>
    # 6- Comment
      # Still room in the flight!

    # [ Add Location ]
    # [ All Done ]
