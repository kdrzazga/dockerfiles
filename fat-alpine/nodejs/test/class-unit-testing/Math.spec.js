//mocha Math.spec.js
const Math = require('./Math');
const assert = require('assert');

const m = new Math();

describe('Math', () => {
  
    it('(static method) should add two numbers correctly', () => {
      assert(Math.add(2, 3) == 5);
      assert(Math.add(10, 5) == 15);
    });

    it('(non-static method) should subtract corectly', () => {
      assert(m.sub(5, 3) == 2);
    });
});
