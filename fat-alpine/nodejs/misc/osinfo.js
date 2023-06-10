const os = require('os');

console.log('Platform:', os.platform());
console.log('Architecture:', os.arch());
console.log('Hostname:', os.hostname());
console.log('Total Memory (bytes):', os.totalmem());
console.log('Free Memory (bytes):', os.freemem());
console.log('CPU Information:', os.cpus());
console.log('Network Interfaces:', os.networkInterfaces());
