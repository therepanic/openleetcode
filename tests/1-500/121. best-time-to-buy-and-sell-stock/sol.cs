public class Solution {
    public int MaxProfit(int[] prices) {
        int best = 0;
        int minPrice = int.MaxValue;
        foreach (int price in prices) {
            minPrice = Math.Min(minPrice, price);
            best = Math.Max(best, price - minPrice);
        }
        return best;
    }
}
