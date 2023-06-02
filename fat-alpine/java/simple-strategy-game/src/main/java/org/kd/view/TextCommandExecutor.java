package org.kd.view;

import org.kd.model.BoardField;
import org.kd.model.CommandExecutor;
import org.kd.model.Game;
import org.kd.model.Output;
import org.kd.model.game_objects.Unit;
import org.kd.model.orders.Order;

import java.util.List;

public class TextCommandExecutor implements CommandExecutor {

    private final Output output;
    private Game game;

    public TextCommandExecutor(Game game, Output output) {
        this.game = game;
        this.output = output;
    }

    public void execute(Order order) {
        CommandParser parser = new CommandParser();
        parser.parse(order.toString());

        if (!parser.validateCommand()) {
            output.log(TextOutputColors.RED_COLOR + "Wrong command" + TextOutputColors.END_COLOUR);
            return;
        }

        if (!parser.validateArguments()) {
            output.log(TextOutputColors.RED_COLOR + "Wrong arguments for command "
                    + parser.getCommand()
                    + TextOutputColors.END_COLOUR);
            return;
        }

        switch (order) {
            case END:
                executeEnd();
                break;
            case MOVE:
                executeMove(order.getArguments());
                break;
            case HELP:
                output.printHelp();
                break;
            case BUILD:
                executeBuild(order.getArguments());
                break;
            case RECRUIT:
                executeRecruit(order.getArguments());
                break;
            case STATUS:
                executeStatus(order.getArguments());
                break;
            case EXIT:
                output.log(TextOutputColors.BLUE_COLOR + "Good bye!" + TextOutputColors.BLUE_COLOR);//will exit in outer loop
                break;
            default:
                output.printError();
        }
    }

    private void executeEnd() {
        game.nextTurn();
        output.log("Turn: " + game.getCurrentTurnNumber() + "\n");
    }


    private void executeMove(List<String> arguments) {
        Unit unit;
        BoardField destination = new BoardField(game.board.ROW_SIZE, game.board.COLUMN_SIZE, arguments.get(1));
        //order = new OrderMove(unit, destination);
    }

    private void executeBuild(List<String> arguments) {
        //TODO: implement
    }

    private void executeRecruit(List<String> arguments) {
        //TODO: implement
    }

    private void executeStatus(List<String> arguments) {
        //TODO: implement

        // BoardField location = new BoardField(arguments.get(0));
        // output.printStatus(this.game.board, location);
    }

    public Game getGame() {
        return game;
    }

}
