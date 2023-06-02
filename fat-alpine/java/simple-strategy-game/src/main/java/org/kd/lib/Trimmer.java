package org.kd.lib;

public class Trimmer {

    public static String trimBeginningAndEnd(String s){
        return s.trim().toLowerCase().replaceAll("\\ +$", "");
    }
}
