class Solution {
    public String stoneGameIII(int[] stoneValue) {
        int n = stoneValue.length;
        int[] dp = new int[3];

        for (int i = n - 1; i >= 0; i--) {
            int takeOne = stoneValue[i] - dp[(i + 1) % 3];

            int takeTwo = Integer.MIN_VALUE;
            if (i + 1 < n) {
                takeTwo = stoneValue[i] + stoneValue[i + 1] - dp[(i + 2) % 3];
            }

            int takeThree = Integer.MIN_VALUE;
            if (i + 2 < n) {
                takeThree = stoneValue[i] + stoneValue[i + 1] + stoneValue[i + 2] - dp[(i + 3) % 3];
            }

            dp[i % 3] = Math.max(takeOne, Math.max(takeTwo, takeThree));
        }

        int value = dp[0];
        if (value > 0) {
            return "Alice";
        } else if (value < 0) {
            return "Bob";
        } else {
            return "Tie";
        }
    }
}
