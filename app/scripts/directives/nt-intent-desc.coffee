'use strict'

angular.module('intentApp')
  .directive('ntIntentDesc', (user) ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      name = user.get()
      type = scope.formatType(scope.intent.type)
      activity = scope.intent.activity
      element.text "#{name} #{type} #{activity}"
  )
