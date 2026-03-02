package com.therepanic.cli;

import com.therepanic.AppConfig;
import picocli.CommandLine;

import java.util.concurrent.Callable;

@CommandLine.Command(name = "get", description = "Get value")
public class ConfigGetCommand implements Callable<Integer> {

    @CommandLine.Parameters(index = "0", paramLabel = "KEY")
    private String key;

    @CommandLine.ParentCommand
    private ConfigCommand parent;

    @Override
    public Integer call() throws Exception {
        AppConfig config = this.parent.getConfig();
        String value = switch (this.key) {
            case "host" -> config.getHost();
            case "port" -> String.valueOf(config.getPort());
            default -> {
                System.err.println("Unknown key: " + this.key);
                System.err.println("Available keys: host, port");
                yield null;
            }
        };
        if (value != null) {
            System.out.println(this.key + " = " + value);
        }
        return 0;
    }

}
