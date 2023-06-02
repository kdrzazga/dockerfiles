package org.kd.model.game_objects;

import org.kd.model.Player;

public class Peasant extends CivilianUnit {

    private static int redPeasantsAmount = 0;
    private static int bluePeasantsAmount = 0;

    public Peasant(Player side, VelocityVector v){
        super(side, v);
        this.hitPoints = 4;

        if (side.equals(Player.RED)) {
            id = redPeasantsAmount;
            redPeasantsAmount++;
        } else {
            id = bluePeasantsAmount;
            bluePeasantsAmount++;
        }
    }
}
