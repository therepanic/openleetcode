
class Solution {
    public int numDistinct(String s, String t) {
        long[] dp = new long[t.length() + 1];
        dp[0] = 1;
        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            for (int j = t.length() - 1; j >= 0; j--) {
                if (ch == t.charAt(j)) dp[j + 1] += dp[j];
            }
        }
        return (int) dp[t.length()];
    }
}
