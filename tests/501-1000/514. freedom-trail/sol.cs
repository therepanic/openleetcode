public class Solution {
    private int Dist(int size, int p, int t) {
        return Math.Min(Math.Abs(t - p), size - Math.Abs(t - p));
    }
    
    public int FindRotateSteps(string ring, string key) {
        int[,] mp = new int[26, 100];
        int[] freq = new int[26];
        int[,] dp = new int[100, 100];
        
        int n = ring.Length;
        int m = key.Length;
        
        for (int i = 0; i < n; i++) {
            int idx = ring[i] - 'a';
            mp[idx, freq[idx]] = i;
            freq[idx]++;
        }
        
        int firstChar = key[0] - 'a';
        for (int i = 0; i < freq[firstChar]; i++) {
            dp[0, mp[firstChar, i]] = Dist(n, 0, mp[firstChar, i]) + 1;
        }
        
        for (int i = 1; i < m; i++) {
            int prevChar = key[i - 1] - 'a';
            int currChar = key[i] - 'a';
            for (int j = 0; j < freq[currChar]; j++) {
                int mini = int.MaxValue;
                for (int k = 0; k < freq[prevChar]; k++) {
                    mini = Math.Min(mini, dp[i - 1, mp[prevChar, k]] +
                                   Dist(n, mp[currChar, j], mp[prevChar, k]) + 1);
                }
                dp[i, mp[currChar, j]] = mini;
            }
        }
        
        int lastChar = key[m - 1] - 'a';
        int res = int.MaxValue;
        for (int i = 0; i < freq[lastChar]; i++) {
            res = Math.Min(res, dp[m - 1, mp[lastChar, i]]);
        }
        
        return res;
    }
}
