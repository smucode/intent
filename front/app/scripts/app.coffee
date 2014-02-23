'use strict';

angular.module('intentApp', ['ngRoute'])
  .config ($routeProvider) ->
    $routeProvider

      .when '/',
        templateUrl: 'views/login.html'
        controller: 'LoginCtrl'

      .when '/list',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'

      .when '/settings',
        templateUrl: 'views/settings.html'
        controller: 'SettingsCtrl'

      .when '/create',
        templateUrl: 'views/create-intent.html'
        controller: 'CreateIntentCtrl'

      .when '/select-activity',
        templateUrl: 'views/select-activity.html'
        controller: 'SelectActivityCtrl'

      .when '/select-date',
        templateUrl: 'views/select-date.html'
        controller: 'SelectDateCtrl'

      .when '/select-time',
        templateUrl: 'views/select-time.html'
        controller: 'SelectTimeCtrl'

      .when '/intent/:id',
        templateUrl: 'views/intent.html'
        controller: 'IntentCtrl'

      .otherwise redirectTo: '/'
