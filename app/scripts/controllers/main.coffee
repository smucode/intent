'use strict';

angular.module('sportsideApp')
  .controller 'MainCtrl', ($scope) ->

    $scope.intents =
      'Today':
        1:
          text: 'You want to play squash at Lysaker Squash und Bananorama'
        2:
          text: 'Tiger Woods is playing golf at Pebble Beach'
        5:
          text: 'Pedro and 2000 others is getting drunk at Kråka'
      'Tomorrow':
        3:
          text: 'Therese Løvehjerte: Løpe i Frognerparken?'
        4:
          text: 'Syver: Squash på Lysaker!'
      'Tuesday':
        3:
          text: 'Therese Løvehjerte wants to go jogging in Frognerparken'
        4:
          text: 'Syver, Bjørn and 3 others are playing squash at Lysaker Squash'
      'Wednesday':
        3:
          text: 'Therese Løvehjerte is jogging at Frognerparken'
        4:
          text: 'Syver, Bjørn and 3 others are playing squash at Lysaker Squash'

    foo = [
      {
        date: 12983,
        activity: 124,
        attendees: [911, 121, 131]
      }
    ]

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
