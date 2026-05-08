import java.lang.reflect.*;
import java.time.temporal.TemporalAccessor;
import java.util.*;
import java.io.*;
import java.math.*;
${IMPORTS}

class Main {
    public static void main(String[] args) {
        System.out.println(Json.toJson(${CALL_SOLUTION}));
    }
}

${SOLUTION}

${UTILITIES}
