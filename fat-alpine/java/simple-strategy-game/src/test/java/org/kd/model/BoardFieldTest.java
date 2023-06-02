package org.kd.model;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kd.model.config.Config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.assertEquals;

@RunWith(SpringRunner.class)
@Import(Config.class)
public class BoardFieldTest {

    @Autowired
    private Board board;

    @Test
    public void testGetXY() {
        var a0a0 = new BoardField(board.ROW_SIZE, board.COLUMN_SIZE, "a0a0");
        var a9g0 = new BoardField(board.ROW_SIZE, board.COLUMN_SIZE, "a9g0");

        assertEquals(0 * 10 + 0, a0a0.getTableXCoord());
        assertEquals(0 * 10 + 0, a0a0.getTableYCoord());
        assertEquals(0 * 10 + 9, a9g0.getTableXCoord());
        assertEquals(6 * 10 + 0, a9g0.getTableYCoord());
    }

    @Test
    public void testGetBoardXCoord() {
        var b5c9 = new BoardField(board.ROW_SIZE, board.COLUMN_SIZE, "b5c9");

        assertEquals(1 * 10 + 5, b5c9.getTableXCoord());
    }

    @Test
    public void testFindLowerBoardField1() {
        var a0a0 = new BoardField(board.ROW_SIZE, board.COLUMN_SIZE, "a0a0");
        assertEquals(a0a0.findLowerBoardField(1).toString(), "a0a1");
        assertEquals(a0a0.findLowerBoardField(5).toString(), "a0a5");
        assertEquals(a0a0.findLowerBoardField(11).toString(), "a0b1");
    }

    @Test
    public void testFindLowerBoardField2() {
        var b2a9 = new BoardField(board.ROW_SIZE, board.COLUMN_SIZE, "b2a9");
        assertEquals(b2a9.findLowerBoardField(1).toString(), "b2b0");
        assertEquals(b2a9.findLowerBoardField(5).toString(), "b2b4");
        assertEquals(b2a9.findLowerBoardField(11).toString(), "b2c0");
    }

    @Test
    public void testFindLowerBoardFieldBeyondBoard() {
        var e2q7 = new BoardField(board.ROW_SIZE, board.COLUMN_SIZE, "e2q7");
        assertEquals(e2q7.findLowerBoardField(1).toString(), "e2q8");
        assertEquals(e2q7.findLowerBoardField(5).toString(), "e2q9");
        assertEquals(e2q7.findLowerBoardField(11).toString(), "e2q9");
    }
}
