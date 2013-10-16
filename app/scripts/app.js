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
      .when('/select-activity', {
        templateUrl: 'views/select-activity.html',
        controller: 'SelectActivityCtrl'
      })
      .when('/select-date', {
        templateUrl: 'views/select-date.html',
        controller: 'SelectDateCtrl'
      })
      .when('/select-time', {
        templateUrl: 'views/select-time.html',
        controller: 'SelectTimeCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
