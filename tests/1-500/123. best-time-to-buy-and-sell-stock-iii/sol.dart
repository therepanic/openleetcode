class Solution {
  int maxProfit(List<int> prices) {
    if (prices.isEmpty) {
      return 0;
    }
    var buy1 = -prices[0];
    var sell1 = 0;
    var buy2 = -prices[0];
    var sell2 = 0;
    for (var i = 1; i < prices.length; i++) {
      final price = prices[i];
      if (-price > buy1) {
        buy1 = -price;
      }
      if (buy1 + price > sell1) {
        sell1 = buy1 + price;
      }
      if (sell1 - price > buy2) {
        buy2 = sell1 - price;
      }
      if (buy2 + price > sell2) {
        sell2 = buy2 + price;
      }
    }
    return sell2;
  }
}
