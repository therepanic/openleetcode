class Solution {
  int lastStoneWeightII(List<int> stones) {
    int n = stones.length;
    int total = stones.fold(0, (sum, v) => sum + v);
    int target = total ~/ 2;
    List<int> dp_prev = List.filled(target + 1, 0);
    for (int i = n - 1; i >= 0; i--) {
      List<int> dp_curr = List.filled(target + 1, 0);
      for (int size = 0; size <= target; size++) {
        int skip = dp_prev[size];
        int take = size >= stones[i] ? dp_prev[size - stones[i]] + stones[i] : -9223372036854775808;
        dp_curr[size] = skip > take ? skip : take;
      }
      dp_prev = dp_curr;
    }
    return total - 2 * dp_prev[target];
  }
}
