//npm install -g mocha
//mocha tests.js

// Import necessary testing libraries
//import * as Block from './block.js'
const {Block} = require('./block');
const assert = require('assert');

// Create a test suite for the Block class
describe('Block', () => {
  // Test the rotation of a block
  it('should rotate the block', () => {
    const b1 = new Block('tetris');
    const initialFields = JSON.parse(JSON.stringify(b1.fields)); 
    b1.rotate();
    const rotatedFields = b1.fields;

    // Assert that the rotated block is different from the initial block
    assert.notDeepStrictEqual(rotatedFields, initialFields);
  });

  // Test block creation with specific type
  it('should create a block with specified type', () => {
    const b1 = new Block('tetris');
    assert.deepStrictEqual(b1.fields, [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 1, 1, 1]
    ]);
  });

  // Test block creation with random type
  it('should create a block with random type', () => {
    const b2 = new Block();
    const validTypes = ['tetris', 'block2x2', 'blockT'];
    assert(validTypes.includes(b2.type));
  });
});

