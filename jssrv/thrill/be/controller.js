const http = require('http');
const info = require('./logic.js');

const server = http.createServer((req, res) => {
	
	if (req.method === 'GET' && req.url === '/') {
			res.statusCode = 200;
			res.setHeader('Content-Type', 'text/plain');
			res.end(info());
	} 
	
});
