//npm install -g mocha
//mocha block.spec.js

const Block = require('./block');
const assert = require('assert');

describe('Block', () => {

  it('should rotate the block', () => {
    const b1 = new Block('tetris');
    const initialFields = JSON.parse(JSON.stringify(b1.fields)); 
    b1.rotate();
    const rotatedFields = b1.fields;

    assert.notDeepStrictEqual(rotatedFields, initialFields);
  });

  it('should create a block with specified type', () => {
    const b1 = new Block('tetris');
    assert.deepStrictEqual(b1.fields, [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 1, 1, 1]
    ]);
  });

  it('should create a block with random type', () => {
    const b2 = new Block();
    const validTypes = ['tetris', 'block2x2', 'blockT'];
    assert(validTypes.includes(b2.type));
  });
});
