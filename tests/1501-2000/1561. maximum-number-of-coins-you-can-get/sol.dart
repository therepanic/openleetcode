class Solution {
  int maxCoins(List<int> piles) {
    piles.sort();
    int l = 0;
    int r = piles.length;
    int count = 0;
    for (int i = 0; i < piles.length ~/ 3; i++) {
      count += piles[r-2];
      l += 1;
      r -= 2;
    }
    return count;
  }
}
