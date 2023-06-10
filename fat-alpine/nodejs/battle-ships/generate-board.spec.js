//npm i figlet mocha assert 
//mocha info.spec.js

const {reserveAdjacentTiles, placeShip, drawBoard, board} = require('./generate-board.js');
const assert = require('assert');

describe ('generate-board tests', () => {

  it('should drawBoard draw current state of the board', () =>{
      const shipLength = 4;
      placeShip(board, shipLength);
      reserveAdjacentTiles(board);
      drawBoard(board);
  });
});
