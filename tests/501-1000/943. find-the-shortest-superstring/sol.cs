public class Solution {
    public string ShortestSuperstring(string[] words) {
        int n = words.Length;
        int[,] overlap = new int[n, n];
        
        int GetOverlap(string a, string b) {
            int maxOlap = 0;
            for (int k = 1; k <= Math.Min(a.Length, b.Length); k++) {
                if (a.Substring(a.Length - k) == b.Substring(0, k)) {
                    maxOlap = Math.Max(maxOlap, k);
                }
            }
            return maxOlap;
        }
        
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (i != j) {
                    overlap[i, j] = GetOverlap(words[i], words[j]);
                }
            }
        }
        
        string[,] dp = new string[1 << n, n];
        for (int i = 0; i < n; i++) {
            dp[1 << i, i] = words[i];
        }
        
        for (int mask = 0; mask < (1 << n); mask++) {
            for (int u = 0; u < n; u++) {
                if ((mask & (1 << u)) == 0) continue;
                for (int v = 0; v < n; v++) {
                    if ((mask & (1 << v)) != 0) continue;
                    int newMask = mask | (1 << v);
                    string candidate = dp[mask, u] + words[v].Substring(overlap[u, v]);
                    if (dp[newMask, v] == null || candidate.Length < dp[newMask, v].Length) {
                        dp[newMask, v] = candidate;
                    }
                }
            }
        }
        
        string shortest = "";
        for (int i = 0; i < n; i++) {
            string candidate = dp[(1 << n) - 1, i];
            if (shortest == "" || candidate.Length < shortest.Length) {
                shortest = candidate;
            }
        }
        return shortest;
    }
}
