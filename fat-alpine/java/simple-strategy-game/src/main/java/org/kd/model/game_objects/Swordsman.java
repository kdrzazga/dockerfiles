package org.kd.model.game_objects;

import org.kd.model.Player;

public class Swordsman extends MilitaryUnit  {

    private static int redSwordsmenAmount = 0;
    private static int blueSwordsmenAmount = 0;

    public Swordsman(Player side, VelocityVector v){
        super(side, v);
        this.hitPoints = 12;
        this.range = 1;
        this.attackStrength = 4;

        if (side.equals(Player.RED)) {
            id = redSwordsmenAmount;
            redSwordsmenAmount++;
        } else {
            id = blueSwordsmenAmount;
            blueSwordsmenAmount++;
        }
    }


}
