'use strict';

angular.module('sportsideApp')
  .factory 'intents', (recents, jsonIdStore) ->

    # {
    #   type: 'intent' / 'desire'
    #   activity: 'play golf'
    #   date: 'str'
    # }

    store = jsonIdStore.init 'intents'

    filter = (intents) ->
      now = moment()
      intents.filter (i) ->
        now.isBefore i.date

    sort = (intents) ->
      _.sortBy intents, (i) -> i.date

    group = (intents) ->
      intents.reduce (memo, intent) ->
        date = moment(intent.date)
          .hour(0)
          .minute(0)
          .second(0)
          .millisecond(0)
          .toISOString()
        memo[date] ||= []
        memo[date].push intent; memo
      , {}

    # public

    byId: (id) ->
      store.get id

    fetch: ->
      group sort filter store.all()

    remove: (id) ->
      store.rem id

    save: (intent) ->
      store.save(intent)
      recents.set intent # broadcast?
