const clearScreen = require("clear-screen");

class Ball {
  constructor() {
    this.x = 8;
    this.y = 5;
    this.directionH = 'right';
    this.directionV = 'down';
  }
}

class Board{
  constructor(ball){
    this.sizeX = 31;
    this.sizeY = 7;
    this.ball = ball;
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
      if (y === board.ball.y){
		const repetition = Math.max(0, board.sizeX - board.ball.x - 3);
        console.log('#' + ' '.repeat(board.ball.x) + 'o' + ' '.repeat(repetition) + '#');
	  }
      else console.log('#' + ' '.repeat(board.sizeX - 2) + '#');  
    }

    console.log('#'.repeat(board.sizeX));
    
    console.log(`[${board.ball.x},${board.ball.y}]`);
  }
}

const board = new Board(new Ball());
const drawer = new Drawer();

function main() {
  setInterval(() => {
    clearScreen();
    drawer.draw(board);
    board.moveBall();  
  }, 300);
}

main();
