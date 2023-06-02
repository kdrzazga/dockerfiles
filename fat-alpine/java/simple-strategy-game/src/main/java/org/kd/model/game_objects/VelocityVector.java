package org.kd.model.game_objects;

import org.kd.model.BoardField;

public class VelocityVector {

    public static final float ROTATION_UNIT = (float) (Math.PI / 10);

    public int value;
    public double angle;
    public BoardField position;

    public VelocityVector(int value, double angle, BoardField position) {

        this.value = value;
        this.angle = angle;
        this.position = position;
    }

    public void turnLeft() {
        this.turn(-ROTATION_UNIT);
    }

    public void turnRight() {
        this.turn(ROTATION_UNIT);
    }

    private void turn(double turnAngle) {
        this.angle = (this.angle + turnAngle) % (2 * Math.PI);
    }

}
