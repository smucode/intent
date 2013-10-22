'use strict'

describe 'Filter: moment', () ->

  # load the filter's module
  beforeEach module 'sportsideApp'

  # initialize a new instance of the filter before each test
  moment = {}
  beforeEach inject ($filter) ->
    moment = $filter 'moment'

  it 'should return the input prefixed with "moment filter:"', () ->
    text = 'angularjs'
    expect(moment text).toBe ('moment filter: ' + text)
