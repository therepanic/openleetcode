public class Solution {
    public int MaxProfit(int[] prices) {
        if (prices.Length == 0) {
            return 0;
        }
        int buy1 = -prices[0];
        int sell1 = 0;
        int buy2 = -prices[0];
        int sell2 = 0;
        for (int i = 1; i < prices.Length; i++) {
            int price = prices[i];
            buy1 = Math.Max(buy1, -price);
            sell1 = Math.Max(sell1, buy1 + price);
            buy2 = Math.Max(buy2, sell1 - price);
            sell2 = Math.Max(sell2, buy2 + price);
        }
        return sell2;
    }
}
