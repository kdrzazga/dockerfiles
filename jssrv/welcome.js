const http = require('http');
const { exec } = require('child_process');

console.log('HTTP SERVER\n');
console.log('http://localhost:8080/index.html');

// Start the http-server using the 'http-server' command
const serverProcess = exec('http-server');

// Capture and log any output from the http-server process
serverProcess.stdout.on('data', data => {
  console.log(data.toString());
});

// Handle any errors that occur during the http-server startup
serverProcess.on('error', err => {
  console.error('Error starting http-server:', err);
});

// Gracefully stop the http-server on program termination
process.on('SIGINT', () => {
  serverProcess.kill();
  process.exit();
});
