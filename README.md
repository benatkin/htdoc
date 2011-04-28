``` coffeescript
htdoc = require 'htdoc'
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
  res.send htdoc(doc)

app.listen 3000
```
