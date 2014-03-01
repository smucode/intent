'use strict'

angular.module('intentApp')
  .directive('ntIntentDesc', ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      name = scope.intent.userId
      type = scope.formatType(scope.intent.type)
      activity = scope.intent.activity
      element.text "#{name} #{type} #{activity}"
  )
