package org.kd.model;

public class BoardFactory {

    public Board createBalancedBoard(){
        return new BoardBuilder()
                .createStandardBoard()
                .withPeasants(Player.RED, 3)
                .withPeasants(Player.BLUE, 3)
                .withArchers(Player.RED, 2)
                .withArchers(Player.BLUE, 2)
                .withSwordsmen(Player.RED, 1)
                .withSwordsmen(Player.BLUE, 1)
                .withKnights(Player.RED, 1)
                .withKnights(Player.BLUE, 1)
                .build();
    }

}
