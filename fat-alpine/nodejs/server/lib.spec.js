//mocha lib.spec.js

const { readAscii } = require('./lib.js');
const assert = require('assert');

describe ('LIB tests', () => {

  it('should readAscii return ASCII-art', () =>{
    console.log(readAscii('panda'));
  });
});
