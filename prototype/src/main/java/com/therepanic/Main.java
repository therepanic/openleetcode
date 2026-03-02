package com.therepanic;

import com.therepanic.cli.App;
import picocli.CommandLine;

import java.io.IOException;

public class Main {

    public static void main(String[] args) throws IOException {
        AppConfig appConfig = AppConfig.load();
        System.exit(new CommandLine(new App(appConfig)).execute(args));
    }

}
