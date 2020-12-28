var http = require('http');

http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.send('Hello World from a Node.js webserver\n');
}).listen(8000, '127.0.0.1');

console.log('The server is up and running at http://127.0.0.1:8000/');