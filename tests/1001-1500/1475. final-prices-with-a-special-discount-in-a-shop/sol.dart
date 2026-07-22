class Solution {
  List<int> finalPrices(List<int> prices) {
    List<int> stack = [];
    for (int i = 0; i < prices.length; i++) {
      while (stack.isNotEmpty && prices[stack.last] >= prices[i]) {
        int index = stack.removeLast();
        prices[index] -= prices[i];
      }
      stack.add(i);
    }
    return prices;
  }
}
