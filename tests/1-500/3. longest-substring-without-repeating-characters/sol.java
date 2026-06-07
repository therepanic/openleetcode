import java.util.*;

public class Solution {
    public int lengthOfLongestSubstring(String s) {
        Map<Character, Integer> lastSeen = new HashMap<>();
        int start = 0;
        int res = 0;
        for (int end = 0; end < s.length(); end++) {
            char c = s.charAt(end);
            Integer prev = lastSeen.get(c);
            if (prev != null && prev >= start) {
                start = prev + 1;
            }
            res = Math.max(res, end - start + 1);
            lastSeen.put(c, end);
        }
        return res;
    }
}
