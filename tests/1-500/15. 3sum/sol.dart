class Solution {
  List<List<int>> threeSum(List<int> nums) {
    nums.sort();
    final res = <List<int>>[];
    for (var i = 0; i + 2 < nums.length; i++) {
      if (i > 0 && nums[i] == nums[i - 1]) continue;
      var l = i + 1;
      var r = nums.length - 1;
      while (l < r) {
        final sum = nums[i] + nums[l] + nums[r];
        if (sum == 0) {
          res.add([nums[i], nums[l], nums[r]]);
          l++;
          r--;
          while (l < r && nums[l] == nums[l - 1]) l++;
          while (l < r && nums[r] == nums[r + 1]) r--;
        } else if (sum < 0) {
          l++;
        } else {
          r--;
        }
      }
    }
    return res;
  }
}
