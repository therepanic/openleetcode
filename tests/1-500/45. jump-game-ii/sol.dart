class Solution {
  int jump(List<int> nums) {
    final n = nums.length;
    if (n <= 1) {
      return 0;
    }

    var jumps = 0;
    var currEnd = 0;
    var maxReach = 0;

    for (var i = 0; i < n - 1; i++) {
      maxReach = maxReach > i + nums[i] ? maxReach : i + nums[i];
      if (i == currEnd) {
        jumps++;
        currEnd = maxReach;
        if (currEnd >= n - 1) {
          break;
        }
      }
    }

    return jumps;
  }
}
