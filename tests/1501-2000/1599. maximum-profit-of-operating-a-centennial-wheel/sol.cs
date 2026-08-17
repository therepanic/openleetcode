public class Solution {
    public int MinOperationsMaxProfit(int[] customers, int boardingCost, int runningCost) {
        int wait = 0;
        int profit = 0;
        int maxProfit = 0;
        int ans = -1;
        int i = 0;
        int rotation = 0;

        while (i < customers.Length || wait > 0) {
            if (i < customers.Length) {
                wait += customers[i];
            }
            int boarded = Math.Min(4, wait);
            wait -= boarded;

            rotation++;
            profit += boarded * boardingCost - runningCost;

            if (profit > maxProfit) {
                maxProfit = profit;
                ans = rotation;
            }

            i++;
        }

        return ans;
    }
}
