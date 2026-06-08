using System;
using System.Collections.Generic;

public class Solution {
    public string MinWindow(string s, string t) {
        if (s.Length < t.Length || t.Length == 0) return "";

        var need = new Dictionary<char, int>();
        foreach (var ch in t) {
            if (!need.ContainsKey(ch)) need[ch] = 0;
            need[ch]++;
        }

        int missing = t.Length;
        int left = 0, bestL = 0, bestLen = int.MaxValue;
        for (int right = 0; right < s.Length; right++) {
            char c = s[right];
            if (need.TryGetValue(c, out int cnt)) {
                if (cnt > 0) missing--;
                need[c] = cnt - 1;
            } else {
                need[c] = -1;
            }

            while (missing == 0) {
                int currLen = right - left + 1;
                if (currLen < bestLen) {
                    bestLen = currLen;
                    bestL = left;
                }
                char d = s[left++];
                need[d]++;
                if (need[d] > 0) missing++;
            }
        }

        return bestLen == int.MaxValue ? "" : s.Substring(bestL, bestLen);
    }
}
