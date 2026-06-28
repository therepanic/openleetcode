public class Solution {
    public int MaxProfit(int[] prices, int fee) {
        int hold = -prices[0];
        int cash = 0;

        for (int i = 1; i < prices.Length; i++) {
            cash = Math.Max(cash, hold + prices[i] - fee);
            hold = Math.Max(hold, cash - prices[i]);
        }

        return cash;
    }
}
