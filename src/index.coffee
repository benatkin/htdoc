# ## htdoc
#
# Injects css and js code into an html document.
exports.htdoc = (doc) ->
  css = ['<style type="text/css">', doc.css, "</style>"].join("\n")
  js = ['<script type="text/javascript">', doc.js, "</script>"].join("\n")
  doc.html.replace '</head>', ['', css, js, '</head>'].join("\n")
