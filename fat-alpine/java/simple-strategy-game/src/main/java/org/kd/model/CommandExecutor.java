package org.kd.model;

import org.kd.model.orders.Order;

public interface CommandExecutor {

    void execute(Order order);
}
