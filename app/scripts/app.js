'use strict';

angular.module('sportsideApp', [])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
      })
      .when('/create', {
        templateUrl: 'views/create-intent.html',
        controller: 'CreateIntentCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
