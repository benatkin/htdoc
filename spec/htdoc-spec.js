var vows = require('vows');
var assert = require('assert');
var htdoc = require('../');

var doc = {
  html: [
    "<html>",
    "  <head>",
    "    <title>Hello.</title>",
    "  </head>",
    "  <body>",
    "    <h1>Hello.</h1>",
    "  </body>",
    "</html>"
  ].join("\n"),
  css: "h1 { color: green; font-family: sans-serif; }",
  js: "console && console.log('Hi!')"
}

var suite = vows.describe('simple').addBatch({
  'build combined html': {
    topic: function() {
      return htdoc.htdoc(doc);
    },
    'should contain a script tag': function(html) {
      assert.include(html, '<script');
    },
    'should contain a style tag': function(html) {
      assert.include(html, '<style');
    }
  }
});

suite.export(module);
