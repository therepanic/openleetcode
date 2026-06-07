import java.util.*;

class Solution {
    public String minWindow(String s, String t) {
        if (s.length() < t.length() || t.isEmpty()) return "";

        int[] need = new int[128];
        for (char c : t.toCharArray()) need[c]++;

        int missing = t.length();
        int left = 0, bestL = 0, bestLen = Integer.MAX_VALUE;
        for (int right = 0; right < s.length(); right++) {
            char c = s.charAt(right);
            if (need[c] > 0) missing--;
            need[c]--;

            while (missing == 0) {
                int currLen = right - left + 1;
                if (currLen < bestLen) {
                    bestLen = currLen;
                    bestL = left;
                }
                char d = s.charAt(left++);
                need[d]++;
                if (need[d] > 0) missing++;
            }
        }

        return bestLen == Integer.MAX_VALUE ? "" : s.substring(bestL, bestL + bestLen);
    }
}
