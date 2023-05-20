const figlet = require('figlet');

function info() {
  return [
    'Rules of TicTacToe game are simple and well-known',
	'Sample requests:',
	'http://localhost:{
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
  welcome
};
