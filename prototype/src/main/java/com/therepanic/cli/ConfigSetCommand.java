package com.therepanic.cli;

import com.therepanic.AppConfig;
import picocli.CommandLine;

import java.util.concurrent.Callable;

@CommandLine.Command(name = "set", description = "Set value")
public class ConfigSetCommand  implements Callable<Integer> {

    @CommandLine.ParentCommand
    private ConfigCommand parent;

    @CommandLine.Parameters(index = "0", paramLabel = "KEY")
    private String key;

    @CommandLine.Parameters(index = "1", paramLabel = "VALUE")
    private String value;

    @Override
    public Integer call() throws Exception {
        AppConfig config = this.parent.getConfig();
        switch (this.key) {
            case "host" -> {
                config.setHost(this.value);
            }
            case "port" -> {
                config.setPort(Integer.valueOf(this.value));
            }
            case "backend" -> {
                config.setBackend(Backend.valueOf(this.value.toUpperCase()));
            }
            default -> {
                System.err.println("Unknown key: " + this.key);
                System.err.println("Available keys: host, port, backend");
                return 1;
            }
        }
        config.save();
        System.out.println("✓ " + this.key + " = " + this.value);
        return 0;
    }

}
