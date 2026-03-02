package com.therepanic.cli;

import com.therepanic.AppConfig;
import picocli.CommandLine;

@CommandLine.Command(
        name = "config",
        mixinStandardHelpOptions = true,
        subcommands = {ConfigSetCommand.class, ConfigGetCommand.class, ConfigListCommand.class},
        description = "Configuration"
)
public class ConfigCommand {

    @CommandLine.ParentCommand
    private App parent;

    public AppConfig getConfig() {
        return this.parent.getConfig();
    }

}
