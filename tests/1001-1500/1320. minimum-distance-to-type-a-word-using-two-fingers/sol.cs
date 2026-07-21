public class Solution {
    private int Cal(int a, int b) {
        return Math.Abs(a / 6 - b / 6) + Math.Abs(a % 6 - b % 6);
    }

    public int MinimumDistance(string word) {
        int n = word.Length;
        int[] dp = new int[26];
        int[] ndp = new int[26];

        for (int i = 1; i < n; i++) {
            int p = word[i - 1] - 'A';
            int t = word[i] - 'A';

            for (int j = 0; j < 26; j++) {
                ndp[j] = dp[j] + Cal(p, t);
            }

            for (int j = 0; j < 26; j++) {
                ndp[p] = Math.Min(ndp[p], dp[j] + Cal(j, t));
            }

            (dp, ndp) = (ndp, dp);
        }

        int ans = int.MaxValue;
        for (int i = 0; i < 26; i++) {
            if (dp[i] < ans) ans = dp[i];
        }
        return ans;
    }
}
