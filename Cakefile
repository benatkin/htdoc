# Much of this and package.json were inspired by and/or copied/pasted
# from https://github.com/assaf/zombie

fs            = require("fs")
path          = require("path")
{spawn, exec} = require("child_process")
stdout        = process.stdout

# Use executables installed with npm bundle.
process.env["PATH"] = "node_modules/.bin:#{process.env["PATH"]}"

# ANSI Terminal Colors.
bold  = "\033[0;1m"
red   = "\033[0;31m"
green = "\033[0;32m"
reset = "\033[0m"

# Log a message with a color.
log = (message, color, explanation) ->
  console.log color + message + reset + ' ' + (explanation or '')

# Handle error and kill the process.
onerror = (err)->
  if err
    process.stdout.write "#{red}#{err.stack}#{reset}\n"
    process.exit -1

## Docs ##

documentPages = (callback) ->
  html =
    """
    <html>
      <head>
        <title>htdoc</title>
      </head>
      <body>
        <h1>htdoc</h1>
        <p><a href="source/index.html">Source Code</a></p>
      </body>
    </html>
    """
  fs.mkdir "html", 0777, ->
    fs.writeFile "html/index.html", html, "utf8", callback

documentSource = (callback)->
  log "Documenting source files ...", green
  exec "docco src/*.coffee", (err, stdout, stderr)->
    log stdout, green
    onerror err
    log "Copying to html/source", green
    exec "mkdir -p html && cp -rf docs/ html/source && rm -rf docs", callback

generateDocs = (callback) ->
  log "Generating documentation ...", green
  documentPages (err)->
    onerror err
    documentSource callback

task "doc:pages",  "Generate documentation for main pages",    -> documentPages onerror
task "doc:source", "Generate documentation from source files", -> documentSource onerror
task "doc",        "Generate all documentation",               -> generateDocs onerror
