class Solution {
    public int maxProfit(int k, int[] prices) {
        int n = prices.length;
        if (k == 0 || n < 2) return 0;
        if (k >= n / 2) {
            int ans = 0;
            for (int i = 1; i < n; i++) ans += Math.max(0, prices[i] - prices[i - 1]);
            return ans;
        }

        long[] hold = new long[k + 1];
        long[] free = new long[k + 1];
        for (int i = 0; i <= k; i++) hold[i] = Long.MIN_VALUE / 4;
        for (int price : prices) {
            for (int t = 1; t <= k; t++) {
                hold[t] = Math.max(hold[t], free[t - 1] - price);
                free[t] = Math.max(free[t], hold[t] + price);
            }
        }
        long ans = 0;
        for (long value : free) ans = Math.max(ans, value);
        return (int) ans;
    }
}
