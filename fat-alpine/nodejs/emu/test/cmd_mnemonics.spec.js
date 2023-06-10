//mocha cmd_mnemonics.spec.js

const { loady } = require('../cmd_mnemonics.js');
const assert = require('assert');

describe('loady test', () => {
	
	beforeEach(() => {
    global.registers = {
		PC: 0,
		YR: 0
	};
  });
	
	it('should command LOADY affect registers', () => {
		loady(100);
		
		assert.strictEqual(global.registers.YR, 100);
		assert.strictEqual(global.registers.PC, 2);
	});
});