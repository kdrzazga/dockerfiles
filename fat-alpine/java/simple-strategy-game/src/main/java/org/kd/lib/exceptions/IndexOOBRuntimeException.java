package org.kd.lib.exceptions;

public class IndexOOBRuntimeException extends RuntimeException{
    public IndexOOBRuntimeException(int index){
        super("Index Out of bounds for " + index);
    }

    public IndexOOBRuntimeException(String index){
        super("Index Out of bounds for " + index);
    }

    public IndexOOBRuntimeException(String index, String maxIndex){
        super("Index Out of bounds for " + index + ". Max index = " + maxIndex);
    }
}
