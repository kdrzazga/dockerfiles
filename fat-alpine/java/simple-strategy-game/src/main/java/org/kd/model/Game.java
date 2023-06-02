package org.kd.model;

import org.kd.model.orders.Order;
import org.springframework.beans.factory.annotation.Autowired;

public class Game {

    public Player redPlayer;
    public Player bluePlayer;

    @Autowired
    private Output output;

    @Autowired
    private Input input;
    private CommandExecutor commandExecutor;

    public Board board;

    private long currentTurnNumber;
    private Player turn;

    public Game(Board board, Input input, Output output) {
        this.board = board;
       this.input = input;
        this.output = output;
    }

    public void draw() {
        output.draw(board);
    }

    public void nextTurn() {
        currentTurnNumber++;
    }

    public void start() {
        this.currentTurnNumber = 0;
        this.turn = Player.RED;

        draw();

        var order = Order.END;
        while (!order.equals(Order.EXIT)) {

            order = input.readOrder();
            commandExecutor.execute(order);
        }
        System.exit(0);
    }


    public long getCurrentTurnNumber() {
        return currentTurnNumber;
    }

    public void setCommandExecutor(CommandExecutor commandExecutor) {
        this.commandExecutor = commandExecutor;
    }

    public Output getOutput() {
        return output;
    }

    public void setOutput(Output output) {
        this.output = output;
    }
}
