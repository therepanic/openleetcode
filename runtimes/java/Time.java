import java.lang.reflect.*;
import java.time.temporal.TemporalAccessor;
import java.util.*;

${SOLUTION}

${JSON_GEN}

public class Main {
    public static void main(String[] args) {
        long cur = System.currentTimeMillis();
        ${CALL_SOLUTION};
        long now = System.currentTimeMillis();
        System.out.println(now - cur);
    }
}
