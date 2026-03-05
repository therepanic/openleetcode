package com.therepanic.api.response;

public record PistonExecuteResponse(String language, Run run) {

    public record Run(String stdout, String stderr, String signal) {}
}
