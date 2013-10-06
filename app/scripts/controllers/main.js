'use strict';

angular.module('sportsideApp')
  .controller('MainCtrl', function ($scope) {
    $scope.intents = [
      'You want to play Squash at Lysaker Squash und Bananorama',
      'Tiger Woods is playing golf at Pebble Beach',
      'Therese Løvehjerte is jogging'
    ];
  });
