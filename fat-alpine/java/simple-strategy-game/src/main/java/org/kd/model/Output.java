package org.kd.model;

public interface Output {

    void draw(Board board);

    void printHelp();

    void printStatus(Board board, BoardField objectLocation);

    void log(String message);

    void printError();
}
