class Board {
    constructor(sizeX, sizeY) {
        this.sizeX = sizeX;
        this.sizeY = sizeY;
        this.batMoveStep = 4;

        this.ball = new Ball(50, 50);
    }

    moveBall(gameRunning){
        this.ball.move(1);
    }

    detectHorizontalDeflection(){
        return (this.ball.y <= this.ball.size) || (this.ball.y >= this.sizeY - this.ball.size);
    }

    detectVerticalDeflection(){
        return (this.ball.x <= this.ball.size) || (this.ball.x >= this.sizeX - this.ball.size);
    }

    deflectBallVertically(){
        this.ball.deflectVertically();
    }

    resetBall(){
        this.ball.reset();
    }
}
