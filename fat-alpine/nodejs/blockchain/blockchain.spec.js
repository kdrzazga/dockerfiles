const { Block, Blockchain } = require('./blockchain');

describe('Block', () => {
  let block;

  beforeEach(() => {
    block = new Block(1, new Date().toISOString(), { amount: 4 });
  });

  test('should calculate the correct hash', () => {
    const hash = block.calculateHash();
    expect(hash).toBeDefined();
    expect(hash).toEqual(expect.any(String));
  });

  test('should mine the block with the given difficulty', () => {
    const difficulty = 4;
    block.mineBlock(difficulty);
    expect(block.hash.substring(0, difficulty)).toEqual(
      Array(difficulty + 1).join('0')
    );
  });
});

describe('Blockchain', () => {
  let blockchain;

  beforeEach(() => {
    blockchain = new Blockchain();
  });

  test('should create a genesis block', () => {
    const genesisBlock = blockchain.createGenesisBlock();
    expect(genesisBlock.index).toBe(0);
    expect(genesisBlock.previousHash).toBe('0');
  });

  test('should get the latest block', () => {
    const latestBlock = blockchain.getLatestBlock();
    expect(latestBlock).toEqual(blockchain.chain[blockchain.chain.length - 1]);
  });

  test('should add a new block to the chain', () => {
    const newBlock = new Block(1, new Date().toISOString(), { amount: 8 });
    blockchain.addBlock(newBlock);
    expect(blockchain.chain).toHaveLength(2);
    expect(blockchain.chain[1]).toEqual(newBlock);
  });

  test('should validate a valid blockchain', () => {
    const newBlock1 = new Block(1, new Date().toISOString(), { amount: 4 });
    const newBlock2 = new Block(2, new Date().toISOString(), { amount: 8 });
    blockchain.addBlock(newBlock1);
    blockchain.addBlock(newBlock2);
    expect(blockchain.isChainValid()).toBe(true);
  });

  test('should invalidate a blockchain with tampered block', () => {
    const newBlock1 = new Block(1, new Date().toISOString(), { amount: 4 });
    const newBlock2 = new Block(2, new Date().toISOString(), { amount: 8 });
    blockchain.addBlock(newBlock1);
    blockchain.addBlock(newBlock2);
    blockchain.chain[1].data = { amount: 100 }; // Modify the block data
    expect(blockchain.isChainValid()).toBe(false);
  });
});

