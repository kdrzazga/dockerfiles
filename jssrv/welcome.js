const http = require('http');
const { exec } = require('child_process');

console.log('\x1B[2J\x1B[0f'); //clear screen
console.log('HTTP SERVER\n');
console.log('Exposed ports: 8080, 8090, 8091, 8092, 8093, 8094, 8095');
console.log('\nTry: curl http://localhost:8090');
console.log('To kill all webapps, use the command');
console.log('node killjs.js');
console.log('and start again concrete apps with:');
console.log('node webapp2/be/controller.js > wa2.log 2>&1 &');

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
const thrillProcess = startProcess('node thrill/be/controller.js > /var/thrill.log 2>&1 &');
const webapp2Process = startProcess('node webapp2/be/controller.js > /var/webapp2.log 2>&1 &');
const webapp3Process = startProcess('node webapp3/be/controller.js > /var/webapp3.log 2>&1 &');
const webapp4Process = startProcess('node webapp4/be/controller.js > /var/webapp4.log 2>&1 &');
const webapp5Process = startProcess('node webapp5/be/controller.js > /var/webapp5.log 2>&1 &');
const webapp6Process = startProcess('node webapp6/be/controller.js > /var/webapp6.log 2>&1 &');

// Gracefully stop the processes on program termination
process.on('SIGINT', () => {
  const processes = [serverProcess, thrillProcess, webapp2Process, webapp3Process, webapp4Process, webapp5Process, webapp6Process];

  processes.forEach(app => app.kill());

  process.exit();
});

