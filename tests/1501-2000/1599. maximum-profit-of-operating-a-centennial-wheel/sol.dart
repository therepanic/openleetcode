class Solution {
  int minOperationsMaxProfit(List<int> customers, int boardingCost, int runningCost) {
    int wait = 0;
    int profit = 0;
    int maxProfit = 0;
    int ans = -1;
    int i = 0;
    int rotation = 0;

    while (i < customers.length || wait > 0) {
      if (i < customers.length) {
        wait += customers[i];
      }
      int boarded = wait < 4 ? wait : 4;
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
