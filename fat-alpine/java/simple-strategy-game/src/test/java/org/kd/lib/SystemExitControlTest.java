package org.kd.lib;

import org.junit.Test;
import org.kd.lib.exceptions.ExitTrappedException;

public class SystemExitControlTest {

    @Test
    public void testSystemExitInterception() {
        SystemExitControl.forbidSystemExitCall();

        try {
            System.out.println("Running a program which calls System.exit");
            System.exit(0);
        } catch (ExitTrappedException e) {
            System.out.println("Forbidding call to System.exit");
        }

        SystemExitControl.enableSystemExitCall();

        //System.exit(0);
        //Assert.fail("This code should never be executes because the JVM should have exited");
    }
}
