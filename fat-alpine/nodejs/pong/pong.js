class Ball {
  constructor() {
    this.x = 1;
    this.y = 3;
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
    if (this.ball.directionX === 'right')
      this.ball.x++;
    else
      this.ball.x--;

    if (this.ball.directionY === 'down')
      this.ball.y++;
    else
      this.ball.y--;
    
  }

  checkDeflection(){
    if (this.ball.x <= 1)
      this.ball.directionH = 'right';
    else if (this.ball.x >= board.sizeX - 2)
      this.ball.directionH = 'left';

    if (this.ball.y <= 1)
      this.ball.directionH = 'up';
    else if (this.ball.y >= board.sizeY - 2)
      this.ball.directionH = 'down';    
  }
  
}

class Drawer {
  draw(board){
    console.log('#'.repeat(board.sizeX));

    for (var y = 0; y < board.sizeY; y++){
      if (y === board.ball.y)
        console.log('#' + ' '.repeat(board.ball.x) + 'o' + ' '.repeat(board.sizeX - board.ball.x - 3) + '#');
      else console.log('#' + ' '.repeat(board.sizeX - 2) + '#');  
    }

    console.log('#'.repeat(board.sizeX));
  }
}

const board = new Board(new Ball);
const drawer = new Drawer();

drawer.draw(board);
board.moveBall();
drawer.draw(board);
