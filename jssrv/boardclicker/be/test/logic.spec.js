const { info, click, createBoard, getBoard,	getHistory } = require('./logic');

describe('board tests' =>{
	
	test('test info', () => {
    const infoText = info();
	
	expect(typeof infoText).toBe('string');
    expect(infoText.length).toBeGreaterThan(0);
  });

});