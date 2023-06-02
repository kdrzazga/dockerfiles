package org.kd.view;

import org.kd.model.Input;
import org.kd.model.orders.Order;

import java.io.InputStream;
import java.util.Scanner;


public class TextInput implements Input {

    protected InputStream in;

    private CommandParser parser;

    public TextInput() {
        this.in = System.in;
    }

    @Override
    public Order readOrder() {

        var scanner = new Scanner(in);
        String orderText;
        orderText = scanner.nextLine();
        parser = new CommandParser();
        parser.parse(orderText);

        return parser.getCommand();
    }
}
