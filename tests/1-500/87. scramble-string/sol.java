import java.util.*;

class Solution {
    private final Map<String, Boolean> memo = new HashMap<>();

    public boolean isScramble(String s1, String s2) {
        if (s1.length() != s2.length()) return false;
        memo.clear();
        return dfs(s1, s2);
    }

    private boolean dfs(String a, String b) {
        if (a.equals(b)) return true;
        String key = a + "#" + b;
        if (memo.containsKey(key)) return memo.get(key);
        int[] cnt = new int[26];
        for (int i = 0; i < a.length(); i++) {
            cnt[a.charAt(i) - 'a']++;
            cnt[b.charAt(i) - 'a']--;
        }
        for (int x : cnt) {
            if (x != 0) {
                memo.put(key, false);
                return false;
            }
        }
        int n = a.length();
        for (int i = 1; i < n; i++) {
            if (dfs(a.substring(0, i), b.substring(0, i)) && dfs(a.substring(i), b.substring(i))) {
                memo.put(key, true);
                return true;
            }
            if (dfs(a.substring(0, i), b.substring(n - i)) && dfs(a.substring(i), b.substring(0, n - i))) {
                memo.put(key, true);
                return true;
            }
        }
        memo.put(key, false);
        return false;
    }
}
