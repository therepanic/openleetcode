import java.lang.reflect.*;
import java.time.temporal.TemporalAccessor;
import java.util.*;

${SOLUTION}

${JSON_GEN}

public class Main {
    public static void main(String[] args) {
        System.out.println(Json.toString(new Solution().${CALL_SOLUTION}));
    }
}
