'use strict'

describe 'Service: JsonStore', () ->
  beforeEach module 'intentApp'

  store = {}
  beforeEach inject (_jsonStore_) -> store = _jsonStore_

  assert = chai.assert

  it 'should get and set values', ->
    store.set('foo', 'bar')
    assert.equal store.get('foo'), 'bar'
