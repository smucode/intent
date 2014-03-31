'use strict'

angular.module('intentApp')
  .directive('fbinvite', () ->
    template: '<a class="btn btn-primary btn-block">invite some friends</a>'
    restrict: 'E'
    link: (scope, element, attrs) ->
      intent = scope.intent
      element.on 'click', ->
        FB.ui
          method: "apprequests"
          message: "I intend to #{intent.activity}. Join me! http://intentapp.herokuapp.com/#/intent/#{intent.id}/rsvp"
        , (request, to) ->
          # to is an array of user ids


  )