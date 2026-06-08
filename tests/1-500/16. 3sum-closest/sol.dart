class Solution {
  int threeSumClosest(List<int> nums, int target) {
    nums.sort();
    var best = nums[0] + nums[1] + nums[2];
    for (var i = 0; i + 2 < nums.length; i++) {
      var l = i + 1;
      var r = nums.length - 1;
      while (l < r) {
        final sum = nums[i] + nums[l] + nums[r];
        if ((target - sum).abs() < (target - best).abs()) best = sum;
        if (sum == target) return target;
        if (sum < target) {
          l++;
        } else {
          r--;
        }
      }
    }
    return best;
  }
}
