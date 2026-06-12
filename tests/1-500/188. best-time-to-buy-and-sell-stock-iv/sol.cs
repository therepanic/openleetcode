using System;

public class Solution {
    public int MaxProfit(int k, int[] prices) {
        int n = prices.Length;
        if (k == 0 || n < 2) return 0;
        if (k >= n / 2) {
            int profit = 0;
            for (int i = 1; i < n; i++) profit += Math.Max(0, prices[i] - prices[i - 1]);
            return profit;
        }

        long[] hold = new long[k + 1];
        long[] free = new long[k + 1];
        for (int i = 0; i <= k; i++) hold[i] = long.MinValue / 4;
        foreach (int price in prices) {
            for (int t = 1; t <= k; t++) {
                hold[t] = Math.Max(hold[t], free[t - 1] - price);
                free[t] = Math.Max(free[t], hold[t] + price);
            }
        }
        long best = 0;
        foreach (long value in free) best = Math.Max(best, value);
        return (int) best;
    }
}
