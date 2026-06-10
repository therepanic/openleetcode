
public class Solution {
    public int NumDistinct(string s, string t) {
        long[] dp = new long[t.Length + 1];
        dp[0] = 1;
        foreach (char ch in s) {
            for (int j = t.Length - 1; j >= 0; j--) {
                if (ch == t[j]) dp[j + 1] += dp[j];
            }
        }
        return (int) dp[t.Length];
    }
}
