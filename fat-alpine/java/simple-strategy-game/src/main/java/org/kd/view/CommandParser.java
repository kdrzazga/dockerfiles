package org.kd.view;

import org.kd.lib.Trimmer;
import org.kd.model.orders.Order;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.Vector;
import java.util.stream.Collectors;

public class CommandParser {

    private String command;
    private List<String> arguments = new Vector<>();

    public void parse(String line) {

        var formattedLine = Optional.ofNullable(Trimmer.trimBeginningAndEnd(line))
                .map(String::toLowerCase)
                .orElse("");

        command = extractCommand(formattedLine);
        arguments = extractArguments(formattedLine);
    }

    public Order getCommand() {
        try {
            return Order.valueOf(command.toUpperCase());
        } catch (IllegalArgumentException e) {
            return Order.NULL;
        }
    }

    public boolean validateCommand() {
        return getAvailableCommands()
                .contains(command);
    }

    public boolean validateArguments() {
        return getCommand().getRequiredArgumentsCount() == arguments.size();
    }

    static List<String> getAvailableCommands() {
        return Arrays.stream(Order.values())
                .map(Order::toString)
                .collect(Collectors.toList());
    }

    private List<String> extractArguments(String line) {
        var args = line.replace(extractCommand(line), "").trim();
        var untrimmedArgs = Arrays.asList(args.split(","));
        var extracedArguments = new Vector<String>();

        untrimmedArgs
                .stream()
                .filter(arg -> arg.length() > 0)
                .forEach(untrimmedArg -> extracedArguments.add(Trimmer.trimBeginningAndEnd(untrimmedArg)));

        return extracedArguments;
    }

    private String extractCommand(String line) {
        int spaceIndex = line.indexOf(" ");
         return spaceIndex > -1
                ? Trimmer.trimBeginningAndEnd(line.substring(0, spaceIndex))
                : line;
    }
}
