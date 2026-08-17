class Solution {
    public int maximumScore(int[] nums, int[] multipliers) {
        int m = multipliers.length;
        Integer[][] dp = new Integer[m + 1][m + 1];
        
        java.util.function.BiFunction<Integer, Integer, Integer> f = new java.util.function.BiFunction<>() {
            @Override
            public Integer apply(Integer i, Integer j) {
                int k = i + j;
                if (k == m) return 0;
                if (dp[i][j] != null) return dp[i][j];
                int back = multipliers[k] * nums[nums.length - 1 - j] + apply(i, j + 1);
                int front = multipliers[k] * nums[i] + apply(i + 1, j);
                dp[i][j] = Math.max(front, back);
                return dp[i][j];
            }
        };
        
        return f.apply(0, 0);
    }
}
