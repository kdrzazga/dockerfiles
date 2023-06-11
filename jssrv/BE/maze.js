function generateMaze(size) {
  const maze = [];
  for (let y = 0; y < size; y++) {
    maze.push(new Array(size).fill('#')); // '#' represents walls
  }
  
  for (let y = 0; y < size - 2; y+=3){
    maze[1][y] = ' ';
    maze[2][y + 1] = ' ';
    maze[3][size - y + 2] = ' ';
    maze[size -1][size - y] = ' ';
    maze[size -1][size - y - 2] = ' ';
    maze[size -2][size - y - 1] = ' ';
    maze[size -2][size - y - 2] = ' ';
    maze[size -2][size - y - 3] = ' ';
    }

  if (size > 15 && size > 15){
      for (let x = 15; x < size -1; x++){
          maze[x][2] = ' ';
          maze[x][size - 2] = ' ';
          maze[x][4] = ' ';
          
          for (let y = 3; y < size; y += (y % 3) + 1)
            maze[x - 5][y] = ' ';
      }
  }
  maze[size - 1][size - 1] = '#'
  maze[size - 2][size - 1] = '#'
  maze[size - 1][size - 2] = '#'

  const directions = [
    [1, 0], // Right
    [1, 0], // Right
    [1, 0], // Right
    [0, 1], // Down
    [-1, 0], // Left
    [-1, 0] // Left
  ];

  let y = 0;
  let x = 5;

  while (y < size) {
    const dir = directions[Math.floor(Math.random() * directions.length)];
    const newX = x + dir[0];

    maze[y][newX] = ' ';
    if (dir[1] === 1) {
      y++;
      if (y  + 2 < size){
        maze[y + 1][newX] = ' ';
        maze[y + 2][newX] = ' ';
      }
    }
    x = newX;
  }

  return maze;
}

const maze = generateMaze(33);

console.log('maze');

// Print the maze
maze.forEach(row => console.log(row.join(' ')));
