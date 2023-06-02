package org.kd.model.game_objects;

import org.kd.model.Player;

public class Archer extends MilitaryUnit  {

    private static int redArchersAmount;
    private static int blueArchersAmount;

    public Archer(Player side, VelocityVector v){
        super(side, v);
        this.hitPoints = 10;
        this.attackStrength = 2;
        this.range = 4;

        if (side.equals(Player.RED)) {
            id = redArchersAmount;
            redArchersAmount++;
        } else {
            id = blueArchersAmount;
            blueArchersAmount++;
        }
    }
}
