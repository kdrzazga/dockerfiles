const figlet = require('figlet');

function info() {
  return [
    'Rules of TicTacToe game are simple and well-known',
	'Sample requests:',
	'http://localhost:3000/ => displays this message',
	'http://localhost:3000/ => displays this message & logo'
  ];
}

function welcome() {
  const logo = 'Tic Tac Toe';

  try {
    const asciiArt = figlet.textSync(logo);
    return '\n' + asciiArt + '\n';
  } catch (error) {
    console.error('>LOG: Error generating ASCII art:', error);
    return '';
  }
}

module.exports = {
  info,
  welcome
};
