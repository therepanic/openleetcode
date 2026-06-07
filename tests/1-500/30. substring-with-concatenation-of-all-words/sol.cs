using System;
using System.Collections.Generic;

public class Solution {
    public IList<int> FindSubstring(string s, string[] words) {
        var ans = new List<int>();
        if (string.IsNullOrEmpty(s) || words.Length == 0) return ans;

        int wordLen = words[0].Length;
        int wordCount = words.Length;
        var target = new Dictionary<string, int>();
        foreach (var word in words) {
            target[word] = target.TryGetValue(word, out var count) ? count + 1 : 1;
        }

        for (int offset = 0; offset < wordLen; offset++) {
            int left = offset;
            int right = offset;
            int used = 0;
            var window = new Dictionary<string, int>();

            while (right + wordLen <= s.Length) {
                var word = s.Substring(right, wordLen);
                right += wordLen;

                if (target.ContainsKey(word)) {
                    window[word] = window.TryGetValue(word, out var count) ? count + 1 : 1;
                    used++;
                    while (window[word] > target[word]) {
                        var leftWord = s.Substring(left, wordLen);
                        window[leftWord] = window[leftWord] - 1;
                        left += wordLen;
                        used--;
                    }
                    if (used == wordCount) {
                        ans.Add(left);
                        var leftWord = s.Substring(left, wordLen);
                        window[leftWord] = window[leftWord] - 1;
                        left += wordLen;
                        used--;
                    }
                } else {
                    window.Clear();
                    used = 0;
                    left = right;
                }
            }
        }
        return ans;
    }
}
