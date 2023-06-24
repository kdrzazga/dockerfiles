const http = require('http');
const { info, click, createBoard, getBoard, getHistory } = require('./logic.js');

const server = http.createServer((req, res) => {
	
	res.setHeader('Content-Type', 'application/json');
	
	if (req.method === 'GET'){
		
		if(req.url === '/') {
			res.statusCode = 200;			
			res.end(JSON.stringify(info()));
		}
		
		else if (req.url === '/history'){
			res.statusCode = 200;
			res.end(JSON.stringify(getHistory()));
		}
		else {
			res.statusCode = 404;
			res.end(JSON.stringify('wrong GET request'));
		}
	}
	
	else if (req.method === 'POST'){	
		res.statusCode = 200;
		
		if(req.url === '/start' || req.url === '/reset') {
			let requestBody  = '';			
			req.on('data', chunk => {
				requestBody += chunk;
			});
			
			req.on('end', () => {
				let par = extractParams(requestBody);
				let board = createBoard(par[0], par[1]);
				if (board.length < 1){
					const msg = 'Board not created';
					res.statusCode = 500;
				}
				
				res.end(JSON.stringify(`new game board[${par[0]}, ${par[1]}]`) + board);
			});
			
		}
		else if (req.url === '/click'){
			let requestBody  = '';			
			req.on('data', chunk => {
				requestBody += chunk;
			});
			
			req.on('end', () => {
				let par = extractParams(requestBody);
				click(par[0], par[1]);
				const board = getBoard();
				res.end(JSON.stringify(`${board}`));
			});
		}
		else {
			res.statusCode = 404;
			res.end(JSON.stringify('wrong POST request'));
		}
	}
	
});

function extractParams(json) {
  const str = json.trim();
  const regex = /\d+/g;
  const matches = str.match(regex);

  if (matches) {
    return matches.map(Number);
  }

  return [];
}

server.listen(8091, 'localhost', () => {
  console.log('Server running at http://localhost:8091/');
});
