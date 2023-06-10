const clearScreen = require("clear-screen");
const readline = require('readline');

class Bat {
  constructor() {
	this.y = 5;  
  }
}

class Ball {
  constructor() {
    this.x = 8;
    this.y = 5;
    this.directionH = 'right';
    this.directionV = 'down';
  }
}

class Board{
  constructor(ball, bat){
    this.sizeX = 70;
    this.sizeY = 15;
    this.ball = ball;
	this.bat = bat;
  }

  moveBat(){
	  this.bat.y = this.ball.y;
  }

  moveBall(){
    this.checkDeflection();
    if (this.ball.directionH === 'right')
      this.ball.x++;
    else
      this.ball.x--;

    if (this.ball.directionV === 'down')
      this.ball.y++;
    else
      this.ball.y--;
  }

  checkDeflection(){
    if (this.ball.x <= 0){
      this.ball.directionH = 'right';
      this.ball.x = 1;
    }
    else if (this.ball.x > board.sizeX - 4){
      this.ball.directionH = 'left';
      this.ball.x = board.sizeX - 3;
    }
    if (this.ball.y <= 0) {
      this.ball.directionV = 'down';
      this.ball.y = 1;
    }
    else if (this.ball.y > board.sizeY - 2){
      this.ball.directionV = 'up';
      this.ball.y = board.sizeY - 2;
    }
  }
  
}

class Drawer {
  draw(board){
    console.log('#'.repeat(board.sizeX));

    for (var y = 0; y < board.sizeY; y++){

	  var line = '#' + ' '.repeat(board.sizeX - 2) + '#';//default line  
	  	  
	  if ( (y === board.bat.y - 1) || (y === board.bat.y + 1))
		 line = '|' + ' '.repeat(board.sizeX - 2) + '|';
	  
      if (y === board.ball.y){
		const repetition = Math.max(0, board.sizeX - board.ball.x - 3);
		
		if (y === board.bat.y)
			line = '|' + ' '.repeat(board.ball.x) + 'o' + ' '.repeat(repetition) + '|';
		else
			line = '#' + ' '.repeat(board.ball.x) + 'o' + ' '.repeat(repetition) + '#';
	  }
      
	  console.log(line);  
    }

    console.log('#'.repeat(board.sizeX));
    
    console.log(`[${board.ball.x},${board.ball.y}]`);
  }
}

const board = new Board(new Ball(), new Bat());
const drawer = new Drawer();

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
process.stdin.setRawMode(true);

function main() {
  setInterval(() => {
    clearScreen();
    drawer.draw(board);
    board.moveBall();  
	board.moveBat();
  }, 120);
}

main();
