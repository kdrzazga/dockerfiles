const http = require('http');

const {
	info
} = require('./lib.js');

// Function to stop the server
function stopServer() {
  console.log('Server has been stopped.');
  process.exit(0);
}

const server = http.createServer((req, res) => {
  if (req.method === 'GET' && req.url === '/') {
    console.log('Server is running');
    console.log('Sample requests:');
    console.log('GET / => displays this help');
    console.log('POST /stop => exit server (credentials required)');
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    res.end('Server is running');
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
