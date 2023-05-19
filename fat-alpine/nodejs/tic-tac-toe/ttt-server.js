const http = require('http');
const figlet = require('figlet');

const {
	read
} = require('./model.js');

const {
	info,
	welcome
} = require('./info.js');

console.log(welcome());

const server = http.createServer((req, res) => {
	
  if (req.method === 'GET' && req.url === '/') {
	info().forEach(line => console.log(line));
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    res.end(info().join(' ')); 
  }
  	
  else if (req.method === 'GET' && req.url === '/welcome') {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    res.end(welcome()); 
  }
  
  else {
    res.statusCode = 404;
    res.setHeader('Content-Type', 'text/plain');
    res.end('Not found');
  }
});
  
const port = 3000 +  Math.floor(Math.random() * (150 + 1));
server.listen(port, 'localhost', () => {
  console.log('Server running at http://localhost:' + port + '/');
});
