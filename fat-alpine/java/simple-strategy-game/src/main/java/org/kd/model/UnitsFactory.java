package org.kd.model;

import org.kd.model.game_objects.*;

import java.util.List;
import java.util.Vector;
import java.util.stream.IntStream;

//@Import(Config.class)
public class UnitsFactory {

    /*@Autowired
    private Board board;*/


    public List<Peasant> createPeasantsOnDefaultPositions(Board board, Player side, int amount, int shiftDown) {

        int xCoordinate = (side.equals(Player.RED)) ? 1 : board.COLUMN_SIZE - 2;

        var peasants = new Vector<Peasant>(amount);

        IntStream.range(0, amount).forEach(y -> {

            Peasant newPeasant = new Peasant(side, velocity(board, xCoordinate, y + shiftDown));
            peasants.add(newPeasant);
        });

        return peasants;
    }

    public List<Archer> createArchersOnDefaultPositions(Board board, Player side, int amount) {
        int xCoordinate = (side.equals(Player.RED)) ? 2 : board.COLUMN_SIZE - 3;
        var archers = new Vector<Archer>(amount);

        IntStream.range(0, amount).forEach(y -> {
            var newArcher = new Archer(side, velocity(board, xCoordinate, y));
            archers.add(newArcher);
        });

        return archers;
    }

    public List<Knight> createKnightsOnDefaultPositions(Board board, Player side, int amount) {
        int xCoordinate = (side.equals(Player.RED)) ? 3 : board.COLUMN_SIZE - 4;
        var knights = new Vector<Knight>(amount);

        IntStream.range(0, amount).forEach(y -> {
            var newKnight = new Knight(side, velocity(board, xCoordinate, y));
            knights.add(newKnight);
        });

        return knights;
    }

    public List<Swordsman> createSwordsmenOnDefaultPositions(Board board, Player side, int amount) {
        int xCoordinate = (side.equals(Player.RED)) ? 4 : board.COLUMN_SIZE - 5;
        var swordsmen = new Vector<Swordsman>(amount);

        IntStream.range(0, amount).forEach(y -> {
            var newUnit = new Swordsman(side, velocity(board, xCoordinate, y));
            swordsmen.add(newUnit);
        });

        return swordsmen;
    }

    private VelocityVector velocity(Board board, int x, int y){
        return new VelocityVector(0, 0, new BoardField(x, y, board.ROW_SIZE, board.COLUMN_SIZE));
    }
}
