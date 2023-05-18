//curl -X GET -u "admin:admin" http://localhost:3000
//curl http://localhost:3000/pic/panda
//curl http://localhost:3000
//curl -X POST -u "admin:admin" http://localhost:3000/stop

const http = require('http');

const {
	info,
	readAscii
} = require('./lib.js');

// Function to stop the server
function stopServer() {
  console.log('Server has been stopped.');
  process.exit(0);
}

const server = http.createServer((req, res) => {
	
  if (req.method === 'GET' && req.url === '/') {
	info().forEach(line => console.log(line));
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    res.end('Server is running'); //body
	
  } else if (req.method === 'GET' && req.url.startsWith('/pic/')) {
    const dynamicPart = req.url.slice('/pic/'.length);
    const filename = dynamicPart.split('/')[0];
    const asciiContent = readAscii(filename);

    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    res.end(asciiContent);
	
  } else if (req.method === 'POST' && req.url === '/stop') {
    const auth = req.headers.authorization;

    // Check if the provided credentials are correct
    function isAuthorized(credentials) {
      const expectedCredentials = 'Basic YWRtaW46YWRtaW4=';
      return credentials === expectedCredentials;
    }

    // Check if the request is authorized
    if (auth && isAuthorized(auth)) {
      res.statusCode = 200;
      res.setHeader('Content-Type', 'text/plain');
      res.end('Server stopped.');
      stopServer();
    } else {
      res.statusCode = 401;
      res.setHeader('WWW-Authenticate', 'Basic realm="Secure Area"');
      res.end('Unauthorized');
    }
  } else {
    res.statusCode = 404;
    res.setHeader('Content-Type', 'text/plain');
    res.end('Not found');
  }
});

server.listen(3000, 'localhost', () => {
  console.log('Server running at http://localhost:3000/');
});
