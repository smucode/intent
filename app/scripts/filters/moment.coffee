'use strict';

angular.module('sportsideApp')
  .filter 'moment', () ->
    (date) ->
      moment(date).fromNow();
