class VelocityVector {

    constructor(speed, angle) {
        this.speed = speed;
        this.angle = angle;
    }

    moveX (x, time){
        let distance = this.speed * time;
        return x + distance * Math.cos(this.angle);
    }

    moveY (y, time){
        let distance = this.speed * time;
        return y + distance * Math.sin(this.angle);
    }

    deflectHorizontally(){
        this.angle = -this.angle;
    }
    deflectVertically(){
        this.angle = Math.PI - this.angle;
    }
}
