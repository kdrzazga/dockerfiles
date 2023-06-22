const http = require('http');
const { info, start, readParagraph, readInventory, addToInventory, checkInventory, removeFromInventory} = require('./logic.js');

const server = http.createServer((req, res) => {
	
	if ('GET' === req.method) {		
		res.statusCode = 200;
		res.setHeader('Content-Type', 'text/plain');
		
		if( '/' === req.url){
			res.end(info());
		}
		
		else if ('/start' === req.url) {
			res.end(start());			
		}
		
		else if (req.url.startsWith('/par/')){
			const parId = req.url.substring(5);
			res.end(readParagraph(parId));
		}
		
		else if ('/inv' === req.url){
			const inv = readInventory();
			res.setHeader('Content-Type', 'application/json');
			res.end(JSON.stringify(inv));
		}		
		else if (req.url.startsWith('/inv-check/')){
			const item = req.url.substring(11);
			let presence = checkInventory(item);
			res.setHeader('Content-Type', 'application/json');
			res.end(JSON.stringify(presence));
		}
		
		else {
			res.statusCode = 404;
			res.end('unsupported GET request');
		}
	}
	else if ('PUT' === req.method){
		res.statusCode = 200;
		
		if('/inv' === req.url){
			let requestBody  = '';
			
			req.on('data', chunk => {
				requestBody += chunk;
			});
			
			req.on('end', () => {
				const item = requestBody.trim();
				let success = addToInventory(item);
				const msg2 = success ? '' : 'UN';
				const msg = 'Insert ' + msg2 + 'SUCCESSFUL'
				if (!success){
					res.statusCode = 500;
				}
				
				res.end(msg);
			});
		} else {
			res.statusCode = 404;
			res.end('unsupported PUT request');
		}
	}
	else if ('DELETE' === req.method){
		res.statusCode = 200;
		
		if('/inv' === req.url){
			let requestBody  = '';
			
			req.on('data', chunk => {
				requestBody += chunk;
			});
			
			req.on('end', () => {
				const item = requestBody.trim();
				let success = removeFromInventory(item);
				const msg2 = success ? '' : 'UN';
				const msg = 'Removal of ' + msg2 + 'SUCCESSFUL'
				if (!success){
					res.statusCode = 500;
				}
				
				res.end(msg);
			});
		}
		else {
			res.statusCode = 404;
			res.end('unsupported DELETE request');
		}
	}
	else if ('PATCH' === req.method){
		res.statusCode = 200;
		
		if('/inv' === req.url){
			res.end('PATCH - change parameters of inventory item');
		}
		else {
			res.statusCode = 404;
			res.end('unsupported PATCH request');
		}		
	}
	else {
		res.statusCode = 404;
		res.end('unsupported operation');
	}
	
});

server.listen(8090, 'localhost', () => {
  console.log('Server running at http://localhost:8090/');
});
