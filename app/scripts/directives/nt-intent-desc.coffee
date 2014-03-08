'use strict'

angular.module('intentApp')
  .directive('ntIntentDesc', ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      name = scope.intent.user.id
      activity = scope.intent.activity
      element.text "#{name} is #{activity}"
  )
