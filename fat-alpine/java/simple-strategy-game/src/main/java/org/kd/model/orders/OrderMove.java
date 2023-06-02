package org.kd.model.orders;

import org.kd.model.Board;
import org.kd.model.BoardField;
import org.kd.model.game_objects.NullGameObject;

public class OrderMove {

    private Board board;
    private BoardField destination;
    private BoardField source;

    public OrderMove(Board board, BoardField source, BoardField destination) {

        this.board = board;
        this.source = source;
        this.destination = destination;
    }

    public void execute() {
        if (validateMove()){
           //TODO: not finished// if ()
        }

    }

    private boolean validateMove() {
        var notNullCondition = source != null
                && destination != null
                && board != null;
        if (!notNullCondition) return false;

        return
                board.contains(source)
                && board.contains(destination)
                && !board.getObjectAt(source).getClass().equals(NullGameObject.class)
                && board.getObjectAt(destination).getClass().equals(NullGameObject.class);
    }
}
