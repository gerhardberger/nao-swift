var qs = require('querystring')
var http = require('http')
var url = require('url')

http.createServer(function (req, res) {
  var requrl = url.parse(req.url)
  var o = qs.parse(requrl.query)
  console.log(o);
  res.end(qs.stringify(o))
}).listen(3000)
