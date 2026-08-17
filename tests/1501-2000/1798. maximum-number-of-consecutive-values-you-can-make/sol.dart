class Solution {
  int getMaximumConsecutive(List<int> coins) {
    coins.sort();
    int maxConsecutive = 0;
    
    for (int coin in coins) {
      if (coin > maxConsecutive + 1) break;
      maxConsecutive += coin;
    }
    
    return maxConsecutive + 1;
  }
}
