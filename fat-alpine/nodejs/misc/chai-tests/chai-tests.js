// npm install chai mocha --save-dev
// npx mocha chai-tests.js

const chai = require('chai');
const assert = chai.assert;
const expect = chai.expect;
chai.should();

describe('Array', function() {
  describe('#indexOf()', function() {
    it('should return -1 when the value is not present', function() {
      const arr = [1, 2, 3];

      const resultAssert = arr.indexOf(4);
      assert.equal(resultAssert, -1);

      const resultExpect = arr.indexOf(4);
      expect(resultExpect).to.equal(-1);

      const resultShould = arr.indexOf(4);
      resultShould.should.equal(-1);
    });
  });
});

describe('Math', function() {
  describe('#add()', function() {
    it('should return the sum of two numbers', function() {
      function add(a, b) {
        return a + b;
      }

      const resultAssert = add(2, 3);
      assert.equal(resultAssert, 5);

      const resultExpect = add(2, 3);
      expect(resultExpect).to.equal(5);

      const resultShould = add(2, 3);
      resultShould.should.equal(5);
    });
  });
});

describe('String', function() {
  describe('#length', function() {
    it('should return the length of a string', function() {
      const str = 'Hello, World!';

      const resultAssert = str.length;
      assert.equal(resultAssert, 13);

      const resultExpect = str.length;
      expect(resultExpect).to.equal(13);

      const resultShould = str.length;
      resultShould.should.equal(13);
    });
  });
});
