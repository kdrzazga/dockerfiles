//npm i figlet mocha assert 
//mocha info.spec.js

const {info} = require('../info.js');
const assert = require('assert');

describe ('info tests', () => {

  it('should info return 4 captions', () =>{
    assert.strictEqual(info().length, 4);
  });
});
