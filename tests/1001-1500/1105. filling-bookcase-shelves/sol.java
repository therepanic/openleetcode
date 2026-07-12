class Solution {
    public int minHeightShelves(int[][] books, int shelfWidth) {
        int n = books.length;
        int[] dp = new int[n + 1];
        for (int i = 1; i <= n; i++) {
            dp[i] = Integer.MAX_VALUE;
        }
        dp[0] = 0;
        
        for (int i = 1; i <= n; i++) {
            dp[i] = dp[i - 1] + books[i - 1][1];
            int height = 0;
            int width = 0;
            for (int j = i - 1; j >= 0; j--) {
                height = Math.max(books[j][1], height);
                width += books[j][0];
                if (width > shelfWidth) {
                    break;
                }
                dp[i] = Math.min(dp[i], dp[j] + height);
            }
        }
        
        return dp[n];
    }
}
