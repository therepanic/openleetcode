class Solution {
    private int dist(int size, int p, int t) {
        return Math.min(Math.abs(t - p), size - Math.abs(t - p));
    }
    
    public int findRotateSteps(String ring, String key) {
        int[][] mp = new int[26][100];
        int[] freq = new int[26];
        int[][] dp = new int[100][100];
        
        int n = ring.length();
        int m = key.length();
        
        for (int i = 0; i < n; i++) {
            int idx = ring.charAt(i) - 'a';
            mp[idx][freq[idx]] = i;
            freq[idx]++;
        }
        
        int firstChar = key.charAt(0) - 'a';
        for (int i = 0; i < freq[firstChar]; i++) {
            dp[0][mp[firstChar][i]] = dist(n, 0, mp[firstChar][i]) + 1;
        }
        
        for (int i = 1; i < m; i++) {
            int prevChar = key.charAt(i - 1) - 'a';
            int currChar = key.charAt(i) - 'a';
            for (int j = 0; j < freq[currChar]; j++) {
                int mini = Integer.MAX_VALUE;
                for (int k = 0; k < freq[prevChar]; k++) {
                    mini = Math.min(mini, dp[i - 1][mp[prevChar][k]] +
                                   dist(n, mp[currChar][j], mp[prevChar][k]) + 1);
                }
                dp[i][mp[currChar][j]] = mini;
            }
        }
        
        int lastChar = key.charAt(m - 1) - 'a';
        int res = Integer.MAX_VALUE;
        for (int i = 0; i < freq[lastChar]; i++) {
            res = Math.min(res, dp[m - 1][mp[lastChar][i]]);
        }
        
        return res;
    }
}
