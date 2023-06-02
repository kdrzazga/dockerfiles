package org.kd.lib;

import org.kd.lib.exceptions.ExitTrappedException;

import java.security.Permission;

public class SystemExitControl {

    public static void forbidSystemExitCall() {
        final var securityManager = new SecurityManager() {
            @Override
            public void checkPermission(Permission permission) {
                if (permission.getName().contains("exitVM")) {
                    throw new ExitTrappedException();
                }
            }
        };
        System.setSecurityManager(securityManager);
    }

    public static void enableSystemExitCall() {
        System.setSecurityManager(null);
    }
}
