package org.kd.model;

public class GameObject {

    public BoardField location;
    public int hitPoints;
    protected Player side;
    protected boolean alive = true;

    public GameObject(BoardField location){
        this.location = location;
    }

    public void decreaseHitPoints(int amount) {
        if (this.hitPoints - amount > 0) {
            this.hitPoints -= amount;
        } else {
            kill();
        }
    }

    protected void kill() {
        this.hitPoints = 0;
        this.alive = false;
    }

    public boolean isAlive() {
        return alive;
    }

    public Player getSide() {
        return side;
    }

}
