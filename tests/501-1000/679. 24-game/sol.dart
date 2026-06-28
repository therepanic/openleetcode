class Solution {
  static const double eps = 1e-6;

  bool judgePoint24(List<int> cards) {
    List<double> nums = cards.map((e) => e.toDouble()).toList();
    return dfs(nums);
  }

  bool dfs(List<double> nums) {
    if (nums.length == 1) {
      return (nums[0] - 24.0).abs() < eps;
    }

    for (int i = 0; i < nums.length; i++) {
      for (int j = 0; j < nums.length; j++) {
        if (i == j) continue;

        List<double> nextNums = [];
        for (int k = 0; k < nums.length; k++) {
          if (k != i && k != j) {
            nextNums.add(nums[k]);
          }
        }

        double a = nums[i], b = nums[j];
        List<double> candidates = [a + b, a - b, b - a, a * b];
        if (b.abs() > eps) candidates.add(a / b);
        if (a.abs() > eps) candidates.add(b / a);

        for (double val in candidates) {
          if (dfs([...nextNums, val])) {
            return true;
          }
        }
      }
    }
    return false;
  }
}
