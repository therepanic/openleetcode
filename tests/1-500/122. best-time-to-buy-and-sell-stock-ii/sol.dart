class Solution {
  int maxProfit(List<int> prices) {
    var profit = 0;
    for (var i = 1; i < prices.length; i++) {
      if (prices[i] > prices[i - 1]) {
        profit += prices[i] - prices[i - 1];
      }
    }
    return profit;
  }
}
