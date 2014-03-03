'use strict';

angular.module('intentApp', ['ngRoute', 'ngMd5'])
  .config ($routeProvider) ->
    $routeProvider

      .when '/',
        templateUrl: 'partials/login.html'
        controller: 'LoginCtrl'

      .when '/list',
        templateUrl: 'partials/main.html'
        controller: 'MainCtrl'

      .when '/settings',
        templateUrl: 'partials/settings.html'
        controller: 'SettingsCtrl'

      .when '/create',
        templateUrl: 'partials/create-intent.html'
        controller: 'CreateIntentCtrl'

      .when '/select-activity',
        templateUrl: 'partials/select-activity.html'
        controller: 'SelectActivityCtrl'

      .when '/select-date',
        templateUrl: 'partials/select-date.html'
        controller: 'SelectDateCtrl'

      .when '/select-time',
        templateUrl: 'partials/select-time.html'
        controller: 'SelectTimeCtrl'

      .when '/intent/:id',
        templateUrl: 'partials/intent.html'
        controller: 'IntentCtrl'
        resolve:
          intent: ['$q', '$route', 'intentProxy', ($q, $route, intentProxy) ->
            deferred = $q.defer()
            intentProxy.read $route.current.params.id, deferred.resolve
            deferred.promise
          ]

      .otherwise redirectTo: '/'
