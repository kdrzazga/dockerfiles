const fs = require('fs');

const nameFileJson = {
  'batman': 'batman.ansi.txt',
  'c=': 'c.ansi.txt',
  'mk': 'mk.ansi.txt',
  'coca-cola': 'cola.ansi.txt',
  'coexist': 'coexist.txt',
  'gadu-gadu': 'gg.ansi.txt',
  'greek': 'greek.txt',
  'jing-jang': 'jinjang.ansi.txt',
  'lego': 'lego.ansi.txt',
  'linux': 'linuing.ansi.txt',
  'panda': 'panda.txt'
};

function info() {
  const infoLines = [
    'Server is running',
    'Sample requests:',
    'GET / => displays this help',
    'POST /stop => exit server (credentials required)',
	'\nSample requests:'];

  for (const key in nameFileJson) {
    const sampleRequest = `curl http://localhost:3000/pic/${key}`;
    infoLines.push(sampleRequest);
  }

  return infoLines;
}


function readAscii(name) {

  try {
    const data = fs.readFileSync('pics/' + nameFileJson[name], 'utf8');
    return data;
  } catch (err) {
    console.error('Error reading file:', err);
    return '';
  }
}

function log(message) {
  console.log(`Appending message to file: ${message}`);
  const logEntry = `${message}\n`;

  try {
    fs.appendFileSync('log1', logEntry, 'utf8');
  } catch (err) {
    console.error('Error appending to log file:', err);
    throw err;
  }
}

module.exports = {
  info,
  readAscii,
  log
};