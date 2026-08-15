public class Solution {
    public int LongestPalindrome(string word1, string word2) {
        string word = word1 + word2;
        int n = word.Length;
        int[,] memo = new int[n, n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                memo[i, j] = -1;
            }
        }
        
        System.Func<int, int, int> fn = null;
        fn = (lo, hi) => {
            if (lo >= hi) return lo == hi ? 1 : 0;
            if (memo[lo, hi] != -1) return memo[lo, hi];
            if (word[lo] == word[hi]) {
                memo[lo, hi] = 2 + fn(lo+1, hi-1);
            } else {
                memo[lo, hi] = System.Math.Max(fn(lo+1, hi), fn(lo, hi-1));
            }
            return memo[lo, hi];
        };
        
        int ans = 0;
        var seen = new System.Collections.Generic.HashSet<char>();
        for (int i = 0; i < word1.Length; i++) {
            char c = word1[i];
            if (seen.Contains(c)) continue;
            seen.Add(c);
            int idx1 = word1.IndexOf(c);
            int idx2 = word2.LastIndexOf(c);
            if (idx1 != -1 && idx2 != -1) {
                ans = System.Math.Max(ans, fn(idx1, idx2 + word1.Length));
            }
        }
        return ans;
    }
}
