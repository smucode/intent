'use strict';

angular.module('sportsideApp')
  .factory 'intents', () ->
    acts = [
      'You want to play squash at Lysaker Squash und Bananorama'
      'Tiger Woods is playing golf at Pebble Beach'
      'Pedro and 2000 others is getting drunk at Kråka'
      'Therese Løvehjerte: Løpe i Frognerparken?'
      'Syver: Squash på Lysaker!'
      'Therese Løvehjerte wants to go jogging in Frognerparken'
      'Syver, Bjørn and 3 others are playing squash at Lysaker Squash'
      'Therese Løvehjerte is jogging at Frognerparken'
    ]
    rndActs = ->
      _.reduce [0..Math.random() * 10 | 0], (memo, i) ->
        memo[i] = text: acts[Math.random() * acts.length | 0]; memo
      , {}

    pending = {}

    fetch: ->
      'Today':     rndActs()
      'Tomorrow':  rndActs()
      'Tuesday':   rndActs()
      'Wednesday': rndActs()
    createNew: ->
      pending = {}
    updateNew: ->
      pending
