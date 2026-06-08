import java.util.*;

public class Solution {
    public String simplifyPath(String path) {
        List<String> parts = new ArrayList<>();
        for (String part : path.split("/")) {
            if (part.isEmpty() || part.equals(".")) {
                continue;
            }
            if (part.equals("..")) {
                if (!parts.isEmpty()) {
                    parts.remove(parts.size() - 1);
                }
            } else {
                parts.add(part);
            }
        }

        if (parts.isEmpty()) {
            return "/";
        }
        return "/" + String.join("/", parts);
    }
}
