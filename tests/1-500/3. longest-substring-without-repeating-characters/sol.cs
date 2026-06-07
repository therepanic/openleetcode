using System.Collections.Generic;

public class Solution {
    public int LengthOfLongestSubstring(string s) {
        var lastSeen = new Dictionary<char, int>();
        var start = 0;
        var res = 0;
        for (var end = 0; end < s.Length; end++) {
            var c = s[end];
            if (lastSeen.TryGetValue(c, out var prev) && prev >= start) {
                start = prev + 1;
            }
            res = System.Math.Max(res, end - start + 1);
            lastSeen[c] = end;
        }
        return res;
    }
}
