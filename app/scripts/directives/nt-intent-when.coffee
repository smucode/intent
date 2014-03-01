'use strict'

angular.module('intentApp')
  .directive('ntIntentWhen', (displayUtil) ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      date = displayUtil.formatDate(scope.intent.date)
      hours = scope.intent.time.hours
      mins = scope.intent.time.minutes
      element.text "#{date} at #{hours}:#{mins}"
  )
