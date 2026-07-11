public class Solution {
    public int NumFactoredBinaryTrees(int[] arr) {
        const int MOD = 1_000_000_007;
        Array.Sort(arr);
        Dictionary<int, long> dp = new Dictionary<int, long>();
        HashSet<int> s = new HashSet<int>(arr);
        foreach (int x in arr) {
            dp[x] = 1;
            foreach (int a in arr) {
                if (a > x) break;
                if (x % a == 0) {
                    int b = x / a;
                    if (s.Contains(b)) {
                        dp[x] = (dp[x] + dp[a] * dp[b]) % MOD;
                    }
                }
            }
        }
        long sum = 0;
        foreach (var v in dp.Values) {
            sum = (sum + v) % MOD;
        }
        return (int)sum;
    }
}
