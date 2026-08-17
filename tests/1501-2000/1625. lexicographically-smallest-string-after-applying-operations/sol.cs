using System;
using System.Collections.Generic;
using System.Linq;

public class Solution {
    public string FindLexSmallestString(string s, int a, int b) {
        int n = s.Length;
        var seen = new HashSet<string>();
        void Dfs(string cur) {
            if (seen.Contains(cur)) return;
            seen.Add(cur);
            char[] arr = cur.ToCharArray();
            for (int i = 1; i < n; i += 2) {
                arr[i] = (char)('0' + (arr[i] - '0' + a) % 10);
            }
            Dfs(new string(arr));
            Dfs(cur.Substring(n - b) + cur.Substring(0, n - b));
        }
        Dfs(s);
        return seen.Min();
    }
}
