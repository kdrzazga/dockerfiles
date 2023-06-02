package org.kd.model.game_objects;

import org.kd.model.Player;

public class MilitaryUnit extends Unit {

    protected int range;
    protected int attackStrength;

    public MilitaryUnit(Player side, VelocityVector velocity) {
        super(side, velocity);
    }

    public void attack(){

    }
}
