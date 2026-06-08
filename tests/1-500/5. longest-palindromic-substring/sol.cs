using System;

public class Solution {
    public string LongestPalindrome(string s) {
        if (string.IsNullOrEmpty(s)) {
            return "";
        }

        int start = 0;
        int best = 1;
        for (int i = 0; i < s.Length; i++) {
            int len1 = Expand(s, i, i);
            int len2 = Expand(s, i, i + 1);
            int len = Math.Max(len1, len2);
            if (len > best) {
                best = len;
                start = i - (len - 1) / 2;
            }
        }

        return s.Substring(start, best);
    }

    private int Expand(string s, int left, int right) {
        while (left >= 0 && right < s.Length && s[left] == s[right]) {
            left--;
            right++;
        }
        return right - left - 1;
    }
}
