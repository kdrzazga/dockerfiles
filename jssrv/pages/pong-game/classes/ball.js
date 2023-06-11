class Ball{

    constructor(x, y) {
        this.x = x;
        this.y = y;
        this.size = 10;
        this.velocity = new VelocityVector(2, Math.PI / 4);
    }

    move(time){
        this.x = this.velocity.moveX(this.x, time);
        this.y = this.velocity.moveY(this.y, time);
    }

    deflectVertically(){
        this.velocity.deflectVertically();
    }

    deflectHorizontally(){
        this.velocity.deflectHorizontally();
    }

    reset(){
        this.velocity = new VelocityVector(2.0, Math.PI / 4);
        this.x = 300.0;
        this.y = 200.0;
    }
}
