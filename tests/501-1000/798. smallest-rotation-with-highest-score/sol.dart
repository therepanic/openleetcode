class Solution {
  int bestRotation(List<int> nums) {
    int n = nums.length;
    List<int> diffs = List.filled(n + 1, 0);
    for (int i = 0; i < n; i++) {
      int left = (i - nums[i] + 1) % n;
      int right = (i + 1) % n;
      diffs[left]--;
      diffs[right]++;
      if (left > right) {
        diffs[0]--;
      }
    }
    int best = 0;
    int cur = n;
    int maxScore = cur;
    for (int k = 1; k < n; k++) {
      cur += diffs[k];
      if (cur > maxScore) {
        maxScore = cur;
        best = k;
      }
    }
    return best;
  }
}
