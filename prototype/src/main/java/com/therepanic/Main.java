package com.therepanic;

import com.therepanic.cli.App;
import picocli.CommandLine;

public class Main {

    public static void main(String[] args) {
        System.exit(new CommandLine(new App()).execute(args));
    }

}
