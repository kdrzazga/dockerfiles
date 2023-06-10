const {shuffle} = require('../lib.js');
const assert = require('assert');

describe('test lib', () => {

  it('should shuffle change order', () => {
    const array = [1, 2, 3, 4];

    var shuffled = shuffle(array);
    console.log(`Shuffled: ${shuffled}`);

    assert.strictEqual(shuffled.length, array.length);

    var i = 0;
    while (i < array.length) {
      const indexToRemove = shuffled.indexOf(array[i]);
      if (indexToRemove !== -1) {
        console.log(`${shuffled[indexToRemove]} OK.`);
        shuffled.splice(indexToRemove, 1);
      }
      i++;
    }//end while

    assert.strictEqual(shuffled.length, 0);
  });
  
});
