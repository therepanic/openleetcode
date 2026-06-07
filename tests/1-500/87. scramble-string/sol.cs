using System.Collections.Generic;

public class Solution {
    private readonly Dictionary<string, bool> memo = new Dictionary<string, bool>();

    public bool IsScramble(string s1, string s2) {
        if (s1.Length != s2.Length) return false;
        memo.Clear();
        return Dfs(s1, s2);
    }

    private bool Dfs(string a, string b) {
        if (a == b) return true;
        string key = a + "#" + b;
        if (memo.TryGetValue(key, out bool value)) return value;
        var cnt = new int[26];
        for (int i = 0; i < a.Length; i++) {
            cnt[a[i] - 'a']++;
            cnt[b[i] - 'a']--;
        }
        foreach (int x in cnt) {
            if (x != 0) {
                memo[key] = false;
                return false;
            }
        }
        for (int i = 1; i < a.Length; i++) {
            if (Dfs(a.Substring(0, i), b.Substring(0, i)) && Dfs(a.Substring(i), b.Substring(i))) {
                memo[key] = true;
                return true;
            }
            if (Dfs(a.Substring(0, i), b.Substring(b.Length - i)) && Dfs(a.Substring(i), b.Substring(0, b.Length - i))) {
                memo[key] = true;
                return true;
            }
        }
        memo[key] = false;
        return false;
    }
}
