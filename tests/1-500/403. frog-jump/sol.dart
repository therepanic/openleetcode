class Solution {
  bool canCross(List<int> stones) {
    Map<int, Set<int>> dp = {};
    for (var stone in stones) {
      dp[stone] = {};
    }
    dp[0] = {0};

    for (var stone in stones) {
      for (var jump in dp[stone]!) {
        for (var jumpDistance in [jump - 1, jump, jump + 1]) {
          if (jumpDistance > 0 && dp.containsKey(stone + jumpDistance)) {
            dp[stone + jumpDistance]!.add(jumpDistance);
          }
        }
      }
    }

    return dp[stones.last]!.isNotEmpty;
  }
}
