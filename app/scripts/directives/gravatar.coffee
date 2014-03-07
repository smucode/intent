'use strict'

angular.module('intentApp')
  .directive('gravatar', () ->
    template: '<img></img>'
    restrict: 'E'
    link: (scope, element, attrs) ->
      size = attrs.size || 50
      hash = attrs.hash
      element.find('img')
        .attr 'src': "http://www.gravatar.com/avatar/#{hash}?s=#{size}&d=monsterid"
  )
