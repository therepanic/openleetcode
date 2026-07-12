class Solution {
    public int minDeletionSize(String[] strs) {
        int m = strs[0].length();
        int[] dp = new int[m];
        for (int i = 0; i < m; i++) {
            dp[i] = 1;
        }
        
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < i; j++) {
                boolean all = true;
                for (String row : strs) {
                    if (row.charAt(j) > row.charAt(i)) {
                        all = false;
                        break;
                    }
                }
                if (all) {
                    dp[i] = Math.max(dp[i], dp[j] + 1);
                }
            }
        }
        
        int maxDp = 0;
        for (int val : dp) {
            maxDp = Math.max(maxDp, val);
        }
        return m - maxDp;
    }
}
