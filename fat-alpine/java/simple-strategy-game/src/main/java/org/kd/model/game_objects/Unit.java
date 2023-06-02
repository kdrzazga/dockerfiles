package org.kd.model.game_objects;

import org.kd.model.BoardField;
import org.kd.model.GameObject;
import org.kd.model.Player;

public class Unit extends GameObject {

    protected int id;
    protected VelocityVector velocity;

    public Unit(Player side, VelocityVector velocity){
        super(velocity.position);
        this.velocity = velocity;
        this.side = side;
    }

    public BoardField orderedLocation;

    public int getId() {
        return id;
    }
}
