'use strict'

angular.module('intentApp')
  .directive('fbavatar', () ->
    template: '<img></img>'
    restrict: 'E'
    link: (scope, element, attrs) ->
      uname = attrs.uname
      element.find('img')
        .attr 'src': "http://graph.facebook.com/#{uname}/picture"
  )
