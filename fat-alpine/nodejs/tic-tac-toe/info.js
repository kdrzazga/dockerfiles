const figlet = require('figlet');

global.port = 3000 + Math.floor(Math.random() * (150 + 1));

function info() {
  return [
    'Rules of TicTacToe game are simple and well-known',
	'Sample requests:',
	'http://localhost:' + global.port + ' => displays help',
	'http://localhost:' + global.port + 'welcome'
  ];
}

function welcome() {
  const logo = 'Tic Tac Toe';

  try {
    const asciiArt = figlet.textSync(logo);
    return asciiArt;
  } catch (error) {
    console.error('>LOG: Error generating ASCII art:', error);
    return '';
  }
}

module.exports = {
  info,
  welcome,
  port
};
