'use strict'

angular.module('intentApp')
  .directive('ntIntentWhen', (displayUtil) ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      date = displayUtil.formatDate(scope.intent.date)
      hours = scope.intent.time.hours
      mins = scope.intent.time.minutes
      name = scope.intent.user.id
      if attrs.dt
        element.text "#{date}, #{hours}:#{mins}"
      else
        element.text "#{hours}:#{mins}"
  )
