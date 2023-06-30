const { generateMaze } = require('./maze');

describe('generateMaze', () => {
  test('should generate a maze of the specified size', () => {
    const size = 10;
    const maze = generateMaze(size);
    
    expect(maze.length).toBe(size);
    maze.forEach(row => {
      expect(row.length).toBe(size);
    });
  });
  
  test('should generate a maze with walls represented by "#" and paths represented by " "', () => {
    const size = 10;
    const maze = generateMaze(size);
    
    maze.forEach(row => {
      row.forEach(cell => {
        expect(cell).toMatch(/[#\s]/);
      });
    });
  });
  
});
