export class Block {
  constructor(type) {
    const typeFieldsJson = {
      'tetris': [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [1, 1, 1, 1]
      ],
      'block2x2': [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [1, 1, 0, 0],
        [1, 1, 0, 0]
      ],
      'blockT': [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 1, 0, 0],
        [1, 1, 1, 0]
      ]
    };

    if (type) {
      this.fields = typeFieldsJson[type];
    } else {
      const types = ['tetris', 'block2x2', 'blockT'];
      const rndTypeIndex = Math.floor(Math.random() * types.length);
      this.fields = typeFieldsJson[types[rndTypeIndex]];
    }
  }

  rotate() {
    const rotatedBlock = [];
    const size = this.fields.length;

    for (let col = 0; col < size; col++) {
      const newRow = [];
      for (let row = size - 1; row >= 0; row--) {
        newRow.push(this.fields[row][col]);
      }
      rotatedBlock.push(newRow);
    }

    this.fields = rotatedBlock;
  }
}

module.exports = {
	Block
};
