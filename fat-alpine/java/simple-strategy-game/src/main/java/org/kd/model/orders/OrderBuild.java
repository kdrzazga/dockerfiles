package org.kd.model.orders;

import org.kd.model.game_objects.Building;
import org.kd.model.game_objects.Peasant;

public class OrderBuild {

    public Peasant builder;
    public Building building;

    public OrderBuild(Peasant builder, Building building) {
        this.builder = builder;
        this.building = building;
    }

    public void execute() {
        //TODO: not finished
    }
}
