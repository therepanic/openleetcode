class Solution {
    private int cal(int a, int b) {
        return Math.abs(a / 6 - b / 6) + Math.abs(a % 6 - b % 6);
    }

    public int minimumDistance(String word) {
        int n = word.length();
        int[] dp = new int[26];
        int[] ndp = new int[26];

        for (int i = 1; i < n; i++) {
            int p = word.charAt(i - 1) - 'A';
            int t = word.charAt(i) - 'A';

            for (int j = 0; j < 26; j++) {
                ndp[j] = dp[j] + cal(p, t);
            }

            for (int j = 0; j < 26; j++) {
                ndp[p] = Math.min(ndp[p], dp[j] + cal(j, t));
            }

            int[] temp = dp;
            dp = ndp;
            ndp = temp;
        }

        int ans = Integer.MAX_VALUE;
        for (int v : dp) ans = Math.min(ans, v);
        return ans;
    }
}
