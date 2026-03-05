package com.therepanic.api.request;

public record PistonExecuteRequest(String language, String stdin, Integer runTimeout, Integer compileTimeout,
                                   Integer compileMemoryLimit, Integer runMemoryLimit, File[] files) {

    public record File(String content) {}
}
