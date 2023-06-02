package org.kd.model;

import org.kd.model.config.Config;
import org.springframework.context.annotation.Import;

@Import(Config.class)
public class BoardBuilder {

    //@Autowired
    private Board board;

    public BoardBuilder() {
        board = new Board();
    }

    public BoardBuilder createStandardBoard() {
        board.peasants = new UnitsFactory().createPeasantsOnDefaultPositions(board, Player.BLUE, 1, 0);
        board.peasants.addAll(new UnitsFactory().createPeasantsOnDefaultPositions(board, Player.RED, 1, 0));
        return this;
    }

    public BoardBuilder withPeasants(Player side, int amount) {
        board.peasants.addAll(new UnitsFactory().createPeasantsOnDefaultPositions(board, side, amount - 1, 1));
        return this;
    }

    public BoardBuilder withArchers(Player side, int amount) {
        board.archers.addAll(new UnitsFactory().createArchersOnDefaultPositions(board, side, amount));
        return this;
    }

    public BoardBuilder withSwordsmen(Player side, int amount) {
        board.swordsmen.addAll(new UnitsFactory().createSwordsmenOnDefaultPositions(board, side, amount));
        return this;
    }

    public BoardBuilder withKnights(Player side, int amount) {
        board.knights.addAll(new UnitsFactory().createKnightsOnDefaultPositions(board, side, amount ));
        return this;
    }

    public Board build() {
        return board;
    }


}
