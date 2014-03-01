'use strict';

angular.module('intentApp')
  .factory 'intents', (recents, jsonIdStore, intentProxy, user) ->

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
      intentProxy.read user.get(), id, callback

    list: (callback) ->
      intentProxy.list user.get(), (intents) ->
        callback group sort filter intents

    remove: (id, callback) ->
      intentProxy.del user.get(), id, callback

    save: (intent, callback) ->
      intent.id = intent.id || ~~(Math.random() * 1000000)
      intentProxy.update user.get(), intent, (intent) ->
        callback intent
        recents.set intent # broadcast?
