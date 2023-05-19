//curl -X GET -u "admin:admin" http://localhost:3000
//curl http://localhost:3000/pic/panda
//curl http://localhost:3000
//curl -X POST -u "admin:admin" http://localhost:3000/stop
//curl -X POST -d "Ala ma kota" http://localhost:3000/log

const figlet = require('figlet');
const http = require('http');

const {
	log,
	info,
	readAscii,
	stopServer
} = require('./lib.js');

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
  } //end POST stop
  else if (req.method === 'POST' && req.url === '/log'){
    let requestBody = '';

    req.on('data', (chunk) => {
      requestBody += chunk;
    });

    req.on('end', () => {
      const message = requestBody.trim();

      try {
        log(message);

        res.statusCode = 200;
        res.setHeader('Content-Type', 'text/plain');
        res.end('Log entry added');
      } catch (err) {
        res.statusCode = 500;
        res.setHeader('Content-Type', 'text/plain');
        res.end('Internal Server Error');
      }
    });  
  } //end POST log
  else {
    res.statusCode = 404;
    res.setHeader('Content-Type', 'text/plain');
    res.end('Not found');
  }
});

const logo = 'server 2';

figlet(logo, function(err, data) {
  if (err) {
    console.log('Something went wrong...');
    console.dir(err);
    return;
  }
  console.log(data);
});

server.listen(3000, 'localhost', () => {
  console.log('Server running at http://localhost:3000/');
});
