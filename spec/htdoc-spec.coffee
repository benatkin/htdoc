vows = require 'vows'
assert = require 'assert'

suite = vows.describe('simple').addBatch
  'build combined html':
    topic: true
    'should be true': (topic) ->
      assert.equal topic, true

suite.export module
