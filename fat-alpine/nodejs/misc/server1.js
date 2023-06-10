/*
nohup node server1.js > lserver1.log 2>&1 &
*/

const http = require('http');

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello, World!');
});

server.listen(1000, 'localhost', () => {
  console.log('Server running at http://localhost:3100/');
});
