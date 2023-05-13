/*
node server2.js > lserver2.log 2>&1 &

2>&1 => redirect std err (type 2) to the same output as std out (type 1)
 & => run in the backgound

curl -X POST http://localhost:3000/stop
curl -X GET http://localhost:3000
*/

const http = require('http');

// Function to stop the server
function stopServer() {
  server.close(() => {
    console.log('Server has been stopped.');
  });
}

const server = http.createServer((req, res) => {
  if (req.method === 'GET' && req.url === '/') {
	  console.log('Server is running');
	  console.log('Sample requests:');
	  console.log('GET / => displays this help');
	  console.log('POST /stop => exit server (credentials required)');
  }
  
  else if (req.method === 'POST' && req.url === '/stop') {
    const auth = req.headers.authorization;

    // Check if the provided credentials are correct
    function isAuthorized(credentials) {
      const expectedCredentials = 'admin admin'; // Replace with your desired credentials
      return credentials === expectedCredentials;
    }

    // Check if the request is authorized
    function handleAuthorization() {
      res.statusCode = 401;
      res.setHeader('WWW-Authenticate', 'Basic realm="Secure Area"');
      res.end('Unauthorized');
    }

    // Process the request
    function handleRequest() {
      res.statusCode = 200;
      res.setHeader('Content-Type', 'text/plain');
      res.end('Server stopped.');

      // Stop the server by calling the function
      stopServer();
    }

    // Handle authorization and request processing
    if (auth && isAuthorized(auth)) {
      handleRequest();
    } else {
      handleAuthorization();
    }
  } else {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    res.end('Hello, World!');
  }
});

server.listen(3000, 'localhost', () => {
  console.log('Server running at http://localhost:3000/');
});

