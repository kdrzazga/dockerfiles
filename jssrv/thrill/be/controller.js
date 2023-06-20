const http = require('http');
const { info, start, readParagraph } = require('./logic.js');

const server = http.createServer((req, res) => {
	
	if (req.method === 'GET') {
		
		res.setHeader('Content-Type', 'text/plain');
		if( '/' === req.url){
			res.statusCode = 200;	
			res.end(info());
		}
		
		else if ('/start' === req.url) {
			res.statusCode = 200;	
			res.end(start());			
		}
		
		else if (req.url.startsWith('/par/')){
			const parId = req.url.substring(5);
			res.statusCode = 200;
			res.end(readParagraph(parId));
		}
	} 
	
});

server.listen(8090, 'localhost', () => {
  console.log('Server running at http://localhost:8090/');
});

