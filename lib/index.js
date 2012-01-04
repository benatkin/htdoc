// Injects css and js code into an html document.
exports.htdoc = function(doc) {
  var css = ['<style type="text/css">', doc.css, "</style>"].join("\n");
  var js = ['<script type="text/javascript">', doc.js, "</script>"].join("\n");
  return doc.html.slice().replace('</head>', ['', css, js, '</head>'].join("\n"));
}
