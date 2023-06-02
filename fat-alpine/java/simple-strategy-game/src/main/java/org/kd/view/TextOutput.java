package org.kd.view;

import org.kd.model.*;
import org.kd.model.game_objects.*;

import java.io.PrintStream;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;
import java.util.stream.IntStream;

public class TextOutput implements Output {

    private PrintStream out;
    private static final Map<Class<? extends Unit>, Character> unitSymbolMap = new Hashtable<>();
    private static final Map<Player, String> playerSymbolMap = new Hashtable<>();
    private static final Map<Player, String> playerColorMap = new Hashtable<>();

    static {
        unitSymbolMap.put(Peasant.class, 'P');
        unitSymbolMap.put(Archer.class, 'A');
        unitSymbolMap.put(Swordsman.class, 'S');
        unitSymbolMap.put(Knight.class, 'K');

        playerSymbolMap.put(Player.BLUE, "b");
        playerSymbolMap.put(Player.RED, "r");

        playerColorMap.put(Player.BLUE, TextOutputColors.BLUE_COLOR);
        playerColorMap.put(Player.RED, TextOutputColors.RED_COLOR);
        playerColorMap.put(Player.NONE, TextOutputColors.INFO_COLOR);

    }

    public TextOutput() {
        out = System.out;
    }

    public TextOutput(PrintStream out){
        this.out = out;
    }

    @Override
    public void draw(Board board) {
        out.print(" ".repeat(4));
        drawHorizontalLine(board);

        for (int c = 0; c < board.ROW_SIZE; c++) {
            final int col = c;
            IntStream.range(0, board.COLUMN_SIZE)
                    .forEach(row -> drawBoardField(board, col, row));
            out.println('|');
            out.print(" ".repeat(4));
            drawHorizontalLine(board);
        }
    }

    @Override
    public void printHelp() {
        out.println("Unit symbol: r - red  b - blue");
        out.println("             P - peasant A - archer S - swordsman k - knight");
        out.println("             number - id of a unit");
        out.println("             rA1 - Red Archer with id=1");
        out.println();
        out.print("Available orders: ");
        CommandParser.getAvailableCommands().forEach(key -> out.print(key + " "));
        out.println();
        out.println("Examples: move 001aa, 005ac");
        out.println("          build bP2, barracks");
        out.println("          build rP1, field");
        out.println("          status bK3");
    }

    @Override
    public void printStatus(Board board, BoardField objectLocation) {
        GameObject object = board.getObjectAt(objectLocation);

        if (object.isAlive()) {
            out.println(object.getClass().getSimpleName());
            out.println("Side: " + object.getSide());
            out.println("Hit Points: " + object.hitPoints);
            out.println("Location: " + object.location);
        }
    }

    public void log(String message) {
        out.println(message);
    }

    @Override
    public void printError() {
        out.println(TextOutputColors.RED_COLOR + "Wrong command" + TextOutputColors.END_COLOUR);
    }

    private void drawHorizontalLine(Board board) {
        out.println(String.valueOf('-').repeat(4 * board.COLUMN_SIZE));
    }

    private void drawBoardField(Board board, int col, int row) {
        if (row == 0) out.format("%03d", col + 1);
        out.print("|");

        Iterator<Unit> unitIterator = board.getAllUnits().iterator();

        boolean found = false;
        while (unitIterator.hasNext()) {
            Unit unit = unitIterator.next();
            if (unit.location.getTableXCoord() == row
                    && unit.location.getTableYCoord() == col) {
                out.print(unitToString(unit));
                found = true;
            }
        }
        if (!found) System.out.print("   ");
    }

    private String unitToString(Unit unit) {

        return playerColorMap.get(unit.getSide())
                + playerSymbolMap.get(unit.getSide())
                + unitSymbolMap.get(unit.getClass())
                + unit.getId()
                + TextOutputColors.END_COLOUR;
    }

    public PrintStream getOut() {
        return out;
    }

    public void setOut(PrintStream out) {
        this.out = out;
    }
}
