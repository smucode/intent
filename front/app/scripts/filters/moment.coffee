'use strict';

angular.module('intentApp')
  .filter 'moment', () ->
    (date) ->
      moment(date).fromNow();
