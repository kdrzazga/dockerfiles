package org.kd;

import org.kd.model.Game;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class TurnBasedGame {

    public static void main(String[] args) {
         SpringApplication.run(TurnBasedGame.class).getBean(Game.class).start();

    }
}
