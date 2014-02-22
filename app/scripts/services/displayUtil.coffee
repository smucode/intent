'use strict'

angular.module('intentApp')
  .factory 'displayUtil', () ->

    moment.lang 'en',
        calendar:
            sameDay: '[Today]'
            nextDay: '[Tomorrow]'
            nextWeek: 'dddd'
            sameElse: 'dddd, MMMM Do'

    formatDate: (date) ->
      l8r = moment(date).format('dddd, MMMM Do')
      return 'Today' if l8r is moment().format('dddd, MMMM Do')
      return 'Tomorrow' if l8r is moment().add('days', 1).format('dddd, MMMM Do')
      return moment(date).calendar('dddd')
