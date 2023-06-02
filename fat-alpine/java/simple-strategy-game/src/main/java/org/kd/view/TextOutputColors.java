package org.kd.view;

class TextOutputColors {
    private static final int NORMAL = 0;
    static final int BRIGHT = 1;

    static final int FOREGROUND_RED = 31;
    static final int FOREGROUND_BLUE = 34;

    static final String PREFIX = "\u001b[";
    static final String SUFFIX = "m";
    static final char SEPARATOR = ';';

    static final String RED_COLOR = PREFIX
            + BRIGHT + SEPARATOR + FOREGROUND_RED + SUFFIX;
    static final String BLUE_COLOR = PREFIX
            + BRIGHT + SEPARATOR + FOREGROUND_BLUE + SUFFIX;
    static final String END_COLOUR = PREFIX + SUFFIX;
    static final String INFO_COLOR = PREFIX
            + NORMAL + SEPARATOR + FOREGROUND_BLUE + SUFFIX;
}
