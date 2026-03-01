package com.therepanic.cli;

import picocli.CommandLine;

import java.nio.file.Path;
import java.util.concurrent.Callable;

@CommandLine.Command(name = "openleetcode", mixinStandardHelpOptions = true)
public class App implements Callable<Integer> {

    @CommandLine.Parameters(index = "0", description = "Path to solve the problem")
    private Path problemSolution;

    @CommandLine.Option(names = {"-i", "--id"}, description = "Problem numeric id")
    private Integer id;

    @CommandLine.Option(names = {"-t", "--title"}, description = "Problem title")
    private String title;

    @CommandLine.Option(names = {"-l", "--lang", "--language"}, description = "Specific language for the problem solution")
    private String lang;

    @Override
    public Integer call() throws Exception {
        return 0;
    }

}
