package com.therepanic.cli;

import com.therepanic.AppConfig;
import picocli.CommandLine;

import java.nio.file.Path;
import java.util.concurrent.Callable;

@CommandLine.Command(mixinStandardHelpOptions = true, subcommands = {ConfigCommand.class})
public class App implements Callable<Integer> {

    private final AppConfig config;

    @CommandLine.Parameters(arity = "0..1", description = "Path to solve the problem")
    private Path problemSolution;

    @CommandLine.Option(names = {"-i", "--id"}, description = "Problem numeric id")
    private Integer id;

    @CommandLine.Option(names = {"-t", "--title"}, description = "Problem title")
    private String title;

    @CommandLine.Option(names = {"-l", "--lang", "--language"}, description = "Specific language for the problem solution")
    private String lang;

    public App(AppConfig config) {
        this.config = config;
    }

    public AppConfig getConfig() {
        return this.config;
    }

    @Override
    public Integer call() throws Exception {
        return 0;
    }

}
