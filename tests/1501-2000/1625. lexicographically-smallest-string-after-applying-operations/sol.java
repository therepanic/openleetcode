import java.util.*;

class Solution {
    public String findLexSmallestString(String s, int a, int b) {
        int n = s.length();
        Set<String> seen = new HashSet<>();
        ArrayDeque<String> queue = new ArrayDeque<>();
        queue.add(s);
        while (!queue.isEmpty()) {
            String cur = queue.remove();
            if (seen.contains(cur)) continue;
            seen.add(cur);
            char[] arr = cur.toCharArray();
            for (int i = 1; i < arr.length; i += 2) {
                arr[i] = (char)('0' + (arr[i] - '0' + a) % 10);
            }
            int len = cur.length();
            queue.add(new String(arr));
            queue.add(cur.substring(len-b) + cur.substring(0, len-b));
        }
        return Collections.min(seen);
    }
    private void dfs(String s, int a, int b, Set<String> seen) {
        if (seen.contains(s)) return;
        seen.add(s);
        char[] arr = s.toCharArray();
        for (int i = 1; i < arr.length; i += 2) {
            arr[i] = (char)('0' + (arr[i] - '0' + a) % 10);
        }
        dfs(new String(arr), a, b, seen);
        int n = s.length();
        dfs(s.substring(n-b) + s.substring(0, n-b), a, b, seen);
    }
}
