class Solution {
  int stoneGameVIII(List<int> stones) {
    for (int i = 1; i < stones.length; i++) {
      stones[i] += stones[i - 1];
    }
    int best = stones.last;
    for (int i = stones.length - 2; i >= 1; i--) {
      final candidate = stones[i] - best;
      if (candidate > best) best = candidate;
    }
    return best;
  }
}
