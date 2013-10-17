'use strict';

angular.module('sportsideApp')
  .factory 'intents', (recents, jsonStore) ->

    # {
    #   type: 'intent' / 'desire'
    #   activity: 'play golf'
    #   date: 'str'
    # }

    # jsonStore.set 'intents', []

    get = ->
      jsonStore.get('intents') || []

    set = (intents) ->
      jsonStore.set 'intents', intents

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

    byId: (strId) ->
      id = parseInt strId, 10
      _.find get(), (i) ->
        i.id is id

    fetch: ->
      group sort filter get()

    remove: (id) ->
      set get().filter (intent) ->
        intent.id isnt id

    save: (intent) ->
      intent.id = Math.random() * 1000 | 0
      intents = get()
      intents.push intent
      set intents
      recents.set intent # broadcast?
