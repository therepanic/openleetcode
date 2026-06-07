public class Solution {
    public String longestPalindrome(String s) {
        if (s.isEmpty()) {
            return "";
        }

        int start = 0;
        int best = 1;
        for (int i = 0; i < s.length(); i++) {
            int len1 = expand(s, i, i);
            int len2 = expand(s, i, i + 1);
            int len = Math.max(len1, len2);
            if (len > best) {
                best = len;
                start = i - (len - 1) / 2;
            }
        }
        return s.substring(start, start + best);
    }

    private int expand(String s, int left, int right) {
        while (left >= 0 && right < s.length() && s.charAt(left) == s.charAt(right)) {
            left--;
            right++;
        }
        return right - left - 1;
    }
}
