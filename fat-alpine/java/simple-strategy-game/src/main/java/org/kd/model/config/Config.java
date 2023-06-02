package org.kd.model.config;

import org.kd.model.*;
import org.kd.view.CommandParser;
import org.kd.view.TextCommandExecutor;
import org.kd.view.TextInput;
import org.kd.view.TextOutput;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

@Configuration
public class Config {

    @Bean
    public Board balancedBoard() {
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

    @Bean
    @Primary
    Game game() {
        var output = output();
        var game = new Game(balancedBoard(), input(), output);
        game.setCommandExecutor(new TextCommandExecutor(game, output));
        return game;
    }

    @Bean
    Input input() {
        return new TextInput();
    }

    @Bean
    public Output output() {
        return new TextOutput();
    }

    @Bean
    CommandParser commandParser(){
        return new CommandParser();
    }
}
