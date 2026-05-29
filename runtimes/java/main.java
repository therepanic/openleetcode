import com.google.gson.*;
import com.google.gson.reflect.TypeToken;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.*;
import java.io.*;
${IMPORTS}

class Main {
    public static void main(String[] args) throws Exception {
        String _TEST_JSON_STR_ = Files.readString(Path.of("test.json"));
        Map<String, Map<String, _TEST_>> _TEST_ = Json.fromJsonMap(_TEST_JSON_STR_);
        ${INSERTION}
    }
}

${SOLUTION}

${UTILITIES}
