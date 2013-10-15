'use strict';

angular.module('sportsideApp')
  .factory 'intents', (recents, jsonStore) ->

    # {
    #   type: 'intent' / 'desire'
    #   activity: 'play golf'
    #   date: 'str'
    # }

    # jsonStore.set 'intents', []

    groupIntents = (intents) ->
      intents.reduce (memo, intent) ->
        memo[intent.date] ||= []
        memo[intent.date].push intent; memo
      , {}

    # public

    fetch: ->
      intents = jsonStore.get('intents') || []
      groupIntents intents

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
