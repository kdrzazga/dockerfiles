const http = require('http');
const { info } = require('./logic.js');

const server = http.createServer((req, res) => {
	
	if (req.method === 'GET')
	{
		res.statusCode = 200;
		res.setHeader('Content-Type', 'application/json');
			
		if (req.url === '/') {
			res.end(JSON.stringify(info()));
		}
		else if ('/flow1' === req.method){
			res.end(JSON.stringify('flow1'));
		}
		
		else{
			res.statusCode = 404;
			res.end(JSON.stringify('wrong GET request'));
		}
	}		
	
});

server.listen(8092, 'localhost', () => {
  console.log('Server running at http://localhost:8092/');
});
