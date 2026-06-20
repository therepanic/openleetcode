class Solution {
  int maxProfit(List<int> prices) {
    var best = 0;
    var minPrice = 1 << 60;
    for (final price in prices) {
      if (price < minPrice) {
        minPrice = price;
      }
      if (price - minPrice > best) {
        best = price - minPrice;
      }
    }
    return best;
  }
}
