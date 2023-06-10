const {sum} = require('./math.js');
const assert = require('assert');

describe('addition', () => {
  it('should add 2 numbers correctly', () => {
 const a = 2;
 const b = 3;

 assert(sum(a, b) == a + b);
  }); //end it
});
  
