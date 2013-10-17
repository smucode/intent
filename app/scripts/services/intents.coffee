'use strict';

angular.module('sportsideApp')
  .factory 'intents', (recents, jsonStore) ->

    # {
    #   type: 'intent' / 'desire'
    #   activity: 'play golf'
    #   date: 'str'
    # }

    # jsonStore.set 'intents', []

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

    fetch: ->
      intents = jsonStore.get('intents') || []
      group sort filter intents

    remove: (id) ->
      intents = jsonStore.get('intents')
      jsonStore.set 'intents', intents.filter (intent) ->
        intent.id isnt id

    save: (intent) ->
      intent.id = Math.random() * 1000 | 0
      intents = jsonStore.get 'intents'
      intents.push intent
      jsonStore.set 'intents', intents
      recents.set intent # broadcast?
