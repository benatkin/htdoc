htdoc = require '../lib/'
express = require 'express'

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

app = express.createServer()

app.get '/', (req, res) ->
  res.send htdoc.htdoc(doc)

app.listen 3000
console.log 'listening on http://127.0.0.1:3000/'
