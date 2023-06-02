package org.kd.model;

import org.junit.Test;
import org.kd.model.orders.Order;

import static org.junit.Assert.assertEquals;

public class OrderTest {

    @Test
    public void testToString(){
        assertEquals("move", Order.MOVE.toString());
        assertEquals("recruit", Order.RECRUIT.toString());
    }

}
