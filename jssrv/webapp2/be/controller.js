const http = require('http');
const { info } = require('./logic.js');

const server = http.createServer((req, res) => {
	
	if (req.method === 'GET'){
		res.setHeader('Content-Type', 'text/plain');
		
		if(req.url === '/') {
			res.statusCode = 200;			
			res.end(info());
		}
		else {
			res.statusCode = 404;
			res.end('wrong GET request');
		}
	}
	
	else if (req.method === 'POST'){
		res.setHeader('Content-Type', 'text/plain');
		
		if(req.url === '/start' || req.url === '/reset') {
			res.statusCode = 200;			
			res.end('new game');
		}
		else {
			res.statusCode = 404;
			res.end('wrong POST request');
		}
	}
	
});

server.listen(8091, 'localhost', () => {
  console.log('Server running at http://localhost:8091/');
});
