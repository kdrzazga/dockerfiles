const http = require('http');
const figlet = require('figlet');

const { read } = require('./model.js');

const { info, welcome } = require('./info.js');

console.log('\n' + welcome() + '\n');

const server = http.createServer((req, res) => {
  console.log(`>LOG: Method: ${req.method}, Endpoint ${req.url}`);

  if (req.method === 'GET' && req.url === '/') {
    info().forEach(line => console.log('>LOG:', line));
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    res.end(info().join(' '));
  }

  else if (req.method === 'GET' && req.url === '/welcome') {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    res.end(welcome());
  }

  else {
    res.statusCode = 404;
    res.setHeader('Content-Type', 'text/plain');
    res.end('Not found');
    console.log('>LOG: URL not found');
  }
});

const port = 3000;// + Math.floor(Math.random() * (150 + 1));

// Getter function for port
function getPort() {
  return port;
}

// Create a property for the getPort function
Object.defineProperty(server, 'port', {
  get: getPort
});

server.listen(server.port, 'localhost', () => {
  console.log('>LOG: Server running at http://localhost:' + server.port + '/');
});

module.exports = {
  getPort
};
