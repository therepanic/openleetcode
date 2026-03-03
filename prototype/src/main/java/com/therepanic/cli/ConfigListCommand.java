package com.therepanic.cli;

import com.therepanic.AppConfig;
import picocli.CommandLine;

import java.util.concurrent.Callable;

@CommandLine.Command(name = "list", description = "List of all commands")
public class ConfigListCommand implements Callable<Integer> {

    @CommandLine.ParentCommand
    private ConfigCommand parent;

    @Override
    public Integer call() throws Exception {
        AppConfig config = this.parent.getConfig();
        System.out.println("host = " + config.getHost());
        System.out.println("port = " + config.getPort());
        System.out.println("backend = " + config.getBackend().toString().toLowerCase());
        return 0;
    }

}
