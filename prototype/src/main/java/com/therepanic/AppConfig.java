package com.therepanic;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Properties;

public class AppConfig {

    private String host = "127.0.0.1";

    private Integer port = 20000;

    private Backend backend = Backend.PISTON;

    private static final Path CONFIG_DIR  = Path.of(System.getProperty("user.home"), ".openleetcode");

    private static final Path CONFIG_FILE = CONFIG_DIR.resolve("config.properties");

    public static AppConfig load() throws IOException {
        AppConfig appConfig = new AppConfig();
        if (!Files.exists(CONFIG_FILE)) {
            return appConfig;
        }
        Properties props = new Properties();
        props.load(Files.newInputStream(CONFIG_FILE));
        if (props.containsKey("host")) {
            appConfig.setHost(props.getProperty("host"));
        }
        if (props.containsKey("port")) {
            appConfig.setPort(Integer.valueOf(props.getProperty("port")));
        }
        if (props.containsKey("backend")) {
            appConfig.setBackend(Backend.valueOf((props.getProperty("backend"))));
        }
        return appConfig;
    }

    public void save() throws IOException {
        Files.createDirectories(CONFIG_DIR);
        Properties props = new Properties();
        if (Files.exists(CONFIG_FILE)) {
            props.load(Files.newInputStream(CONFIG_FILE));
        }
        props.setProperty("host", this.host);
        props.setProperty("port", String.valueOf(this.port));
        props.setProperty("backend", String.valueOf(this.backend));
        props.store(Files.newOutputStream(CONFIG_FILE), "openleetcode save");
    }

    public String getHost() {
        return this.host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public Integer getPort() {
        return this.port;
    }

    public void setPort(Integer port) {
        this.port = port;
    }

    public void setBackend(Backend backend) {
        this.backend = backend;
    }

    public Backend getBackend() {
        return this.backend;
    }
}
