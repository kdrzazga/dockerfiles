//mocha pong.spec.js

const { board } = require('../logic.js');
const assert = require('assert');

describe('Pong tests', () => {

  it('should moveBall change ball coordinates according to a direction of a ball', () => {
    console.log(`Ball is at [${board.ball.x},${board.ball.y}] and is moving [${board.ball.directionH}-${board.ball.directionV}].`);
    const expectedPositionX = board.ball.x + 1;
    const expectedPositionY = board.ball.y + 1;
    console.log(`Expected position is (${expectedPositionX},${expectedPositionY})`)

    board.moveBall();
    
    assert.strictEqual(board.ball.x, expectedPositionX, 'Wrong position X');
    assert.strictEqual(board.ball.y, expectedPositionY, 'Wrong position Y');
  });
  
});
