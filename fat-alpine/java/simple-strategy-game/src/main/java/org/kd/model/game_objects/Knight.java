package org.kd.model.game_objects;

import org.kd.model.Player;

public class Knight extends MilitaryUnit {

    private static int redKnightsAmount = 0;
    private static int blueKnightsAmount = 0;

    public Knight(Player side, VelocityVector v){
        super(side, v);
        this.hitPoints = 20;
        this.attackStrength = 6;
        this.range = 1;

        if (side.equals(Player.RED)) {

            id = redKnightsAmount;
            redKnightsAmount++;

        } else {

            id = blueKnightsAmount;
            blueKnightsAmount++;
        }
    }
}
