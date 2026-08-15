class Solution {
  List<int> minDifference(List<int> nums, List<List<int>> queries) {
    int maxVal = 0;
    for (int x in nums) {
      if (x > maxVal) maxVal = x;
    }
    List<List<int>> p = List.generate(nums.length + 1, (_) => List.filled(maxVal + 1, 0));
    for (int j = 0; j <= maxVal; j++) p[0][j] = 0;
    for (int i = 0; i < nums.length; i++) {
      for (int j = 0; j <= maxVal; j++) {
        p[i + 1][j] = p[i][j] + (nums[i] == j ? 1 : 0);
      }
    }
    List<int> res = [];
    for (var q in queries) {
      int l = q[0], r = q[1];
      List<int> diff = List.filled(maxVal + 1, 0);
      for (int j = 0; j <= maxVal; j++) diff[j] = p[r + 1][j] - p[l][j];
      int prev = -1;
      int best = -1;
      for (int j = 0; j <= maxVal; j++) {
        if (diff[j] > 0) {
          if (prev >= 0) {
            if (best == -1 || j - prev < best) best = j - prev;
          }
          prev = j;
        }
      }
      res.add(best);
    }
    return res;
  }
}
