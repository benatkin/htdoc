vows = require 'vows'
assert = require 'assert'
htdoc = require '../lib/'

doc =
  html:
    """
    <html>
      <head>
        <title>Hello.</title>
      </head>
      <body>
        <h1>Hello.</h1>
      </body>
    </html>
    """
  css:
    """
    h1 {
      color: green;
      font-family: sans-serif;
    }
    """
  js:
    """
    console && console.log('Hi!')
    """

suite = vows.describe('simple').addBatch
  'build combined html':
    topic: () -> htdoc.htdoc(doc)
    'should contain a script tag': (html) ->
      assert.include html, '<script'
    'should contain a style tag': (html) ->
      assert.include html, '<style'

suite.export module
