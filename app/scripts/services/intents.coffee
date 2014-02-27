'use strict';

angular.module('intentApp')
  .factory 'intents', (recents, jsonIdStore, user) ->

    # {
    #   type: 'intent' / 'desire'
    #   activity: 'play golf'
    #   date: 'str'
    # }

    store = null

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

    read: (id, callback) ->
      callback store.get id

    list: (callback) ->
      store = jsonIdStore.init 'intents_' + user.get()
      callback group sort filter store.all()

    remove: (id, callback) ->
      store.rem id
      callback()

    save: (intent, callback) ->
      store.save(intent)
      recents.set intent # broadcast?
      callback intent
