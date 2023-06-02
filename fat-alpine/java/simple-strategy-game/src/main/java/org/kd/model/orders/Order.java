package org.kd.model.orders;

import java.util.List;
import java.util.Map;
import java.util.Vector;

public enum Order {

    BUILD, MOVE, RECRUIT, END, HELP, STATUS, EXIT, NULL;

    private List<String> arguments = new Vector<>();
    protected byte totalDuration;
    protected byte currentDuration;

    private final static Map<Order, Integer> orderArgumentsCountMap = Map.of(
            MOVE, 2,
            BUILD, 2,
            RECRUIT, 2,
            END, 0,
            HELP, 0,
            STATUS, 1,
            EXIT, 0,
            NULL, 0);

    void execute() {
    }

    byte getTotalDuration() {
        return totalDuration;
    }

    byte getCurrentDuration() {
        return currentDuration;
    }

    public List<String> getArguments() {
        return arguments;
    }

    public void setArguments(List<String> arguments) {
        this.arguments = arguments;
    }

    public String toString() {
        return this.name().toLowerCase();
    }

    public int getRequiredArgumentsCount() {
        return orderArgumentsCountMap.get(this);
    }
}
