//mocha info.spec.js

const { getPort } = require('../ttt-server.js');
const assert = require('assert');

describe ('ttt-server tests', () => {

  it('should getPort return port number', () =>{
    const port = getPort();
    assert.strictEqual(typeof port, 'number');
    assert.ok(port > 0);
  });
});
