const http = require('http');
const { exec } = require('child_process');

console.log('HTTP SERVER\n');
console.log('Exposed ports: 8000, 8090, 8091, 8092, 8093, 8094, 8095');

function startProcess(command) {
  const process = exec(command);

  process.stdout.on('data', data => {
    console.log(data.toString());
  });

  process.on('error', err => {
    console.error(`Error starting process with command '${command}':`, err);
  });

  return process;
}

const serverProcess = startProcess('http-server');
const webapp2Process = startProcess('node webapp2/be/controller.js > /var/webapp2.log 2>&1 &');
const webapp3Process = startProcess('node webapp3/be/controller.js > /var/webapp3.log 2>&1 &');
const webapp4Process = startProcess('node webapp4/be/controller.js > /var/webapp4.log 2>&1 &');
const webapp5Process = startProcess('node webapp5/be/controller.js > /var/webapp5.log 2>&1 &');
const webapp6Process = startProcess('node webapp6/be/controller.js > /var/webapp6.log 2>&1 &');

// Gracefully stop t processes on program termination
process.on('SIGINT', () => {
  serverProcess.kill();
  
  webapp2Process.kill();
  webapp3Process.kill();
  webapp4Process.kill();
  webapp5Process.kill();
  webapp6Process.kill();
  
  process.exit();
});
