
package org.kd.model;

import org.kd.lib.exceptions.IndexOOBRuntimeException;

import java.util.List;
import java.util.Vector;
import java.util.stream.IntStream;

public class BoardField {

    private int x;
    private int y;
    private final int maxX;
    private final int maxY;

    public static List<String> availableCoords = new Vector<>(24 * 10);

    static {
        IntStream.range((int) 'a', (int) 'z')
                .forEach(coord1 -> {
                            for (int coord2 = 0; coord2 <= 9; coord2++)
                                availableCoords.add("" + (char) coord1 + coord2);
                        }
                );
    }

    public BoardField(int tableX, int tableY, int maxX, int maxY) {
        this.maxX = maxX;
        this.maxY = maxY;
        this.setTableXCoord(tableX);
        this.setTableYCoord(tableY);
    }

    public BoardField(String x, String y) {
        this.maxX = 10;
        this.maxY = 10;
        this.setBoardXCoord(x);
        this.setBoardYCoord(y);
    }

    public BoardField(int maxX, int maxY, String field) throws IllegalArgumentException {
        this.maxX = maxX;
        this.maxY = maxY;
        if (field.length() == 4 && field.matches("[a-z][0-9][a-z][0-9]")) {

            this.setBoardXCoord(field.substring(0, 2));
            this.setBoardYCoord(field.substring(2, 4));
        } else throw new IllegalArgumentException();
    }

    public BoardField findLowerBoardField(int translationDown) {

        String lowerY = getBoardYCoord();
        while (translationDown > 0 && isYWithinBoard(nextField(lowerY))) {
            lowerY = nextField(lowerY);
            translationDown--;
        }

        BoardField lowerField;

        try {
            lowerField = new BoardField(maxX, maxY, getBoardXCoord() + lowerY);
        } catch (IllegalArgumentException e) {
            lowerField = this;
        }

        return lowerField;
    }

    private String nextField(String field) {
        if (field.equals("z9"))
            return field;

        String next;

        if (field.endsWith("9")) {
            int ascii = (int) field.charAt(0);
            ascii++;
            next = (char) ascii + "0";
        } else {
            int ascii = (int) field.charAt(1);
            ascii++;
            next = field.charAt(0) + "" + (char) ascii + "";
        }

        return next;
    }

    private boolean isXWithinBoard(String x) {
        int index = availableCoords.indexOf(x);
        return index > 0 && index < maxY;
    }

    private boolean isYWithinBoard(String y) {
        int index = availableCoords.indexOf(y);
        return index > 0 && index < maxX;
    }

    public void setBoardYCoord(String y) {
        int index = availableCoords.indexOf(y);

        if (index == -1 || index >= maxX) {
            throw new IndexOOBRuntimeException(y, availableCoords.get(maxX - 1));
        } else {
            this.y = index;
        }
    }

    public void setBoardXCoord(String x) {
        int index = availableCoords.indexOf(x);

        if (index == -1 || index >= maxY) {
            throw new IndexOOBRuntimeException(x, availableCoords.get(maxY - 1));
        } else {
            this.x = index;
        }
    }

    public String getBoardXCoord() {
        return availableCoords.get(x).substring(0, 2);
    }

    public String getBoardYCoord() {
        return availableCoords.get(y);
    }

    public void setTableXCoord(int value) {
        this.x = value;
    }

    public void setTableYCoord(int value) {
        this.y = value;
    }

    public int getTableXCoord() {
        return x;
    }

    public int getTableYCoord() {
        return y;
    }

    public boolean equals(BoardField field) {
        return (field.x == this.x)
                && (field.y == this.y);
    }

    public String toString() {
        return this.getBoardXCoord() + this.getBoardYCoord();
    }
}

